class Indexer
  include Sidekiq::Worker
  sidekiq_options queue: 'elasticsearch', retry: false

  Client = Elasticsearch::Client.new host: 'localhost:9200', logger: Sidekiq.logger

  def perform(operation, record_id, class_obj)
    @log = Logger.new("log/indexer.log")
    @log.debug "#{operation} - ID: #{record_id} | OBJ: #{class_obj.to_s}"

    case operation.to_s
      when /index/
        index_operation(class_obj, record_id)
      when /delete/
        delete_operation(class_obj, record_id)
      else raise ArgumentError, "Unknown operation '#{operation}'"
    end
  end

  private

  def parse_type_and_index(class_obj)
    type = class_obj.split(/(?=[A-Z])/).join("_").downcase
    index = type.pluralize
    [type, index]
  end

  def index_operation(class_obj, record_id)
    record = eval(class_obj).where(id: record_id).first
    type, index = parse_type_and_index(class_obj)
    if record
      indexed_json = eval("#{record.class.to_s.pluralize}::Serializer").new(record).serializable_hash
      Client.index(index: index, type: type, id: record.id, body: indexed_json)
    end
  end

  def delete_operation(class_obj, record_id)
    type, index = parse_type_and_index(class_obj)
    Client.delete index: index, type: type, id: record_id
  end
end

