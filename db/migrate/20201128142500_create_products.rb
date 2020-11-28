class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title,null: false
      t.text :description
      t.integer :price,null: false
      t.text :image,default: "https://lh3.googleusercontent.com/proxy/dnjS9wh1fZY69IOgfhi1kkE2gbA9sM9KW-5fpHJ7Lsfhy84sKN0fpmFHk4hqNPFUXCJiv6_g_tFjGKSTE7JfHdaAYa5qZpg1awLEGYQ"
      t.timestamps
    end
  end
end
