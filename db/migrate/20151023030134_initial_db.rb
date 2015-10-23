class InitialDb < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.string :access_token
      t.timestamps null: false
    end

    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.timestamps null: false
    end

    create_table :articles do |t|
      t.integer :category_id
      t.text :title
      t.text :content
      t.timestamps null: false
    end

    create_table :tips do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :content
      t.timestamps null: false
    end

    create_table :tags do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :name
      t.timestamps null: false
    end

    create_table :comments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :article_id
      t.text :content
      t.timestamps null: false
    end
  end
end
