class CreateFigureTitles < ActiveRecord::Migration
  def change
  	create_table :figure_titles do |t|
  		t.integer :title_id, :figure_id
  	end
  end
end
