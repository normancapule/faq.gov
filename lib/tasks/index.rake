namespace :index do
  task :redo => :environment do
    [Category, Article].each do |class_obj|
      class_obj.__elasticsearch__.client.indices.delete index: class_obj.index_name rescue nil
      class_obj.__elasticsearch__.client.indices.create \
        index: class_obj.index_name,
        body: { settings: class_obj.settings.to_hash, mappings: class_obj.mappings.to_hash }
    end
  end

  task :cache => :environment do
    [Category, Article].each do |obj_class|
      obj_class.all.each do |obj|
        Indexer.perform_async(:index, obj.id, obj.class.to_s)
      end
    end
  end
end
