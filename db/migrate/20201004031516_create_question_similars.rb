class CreateQuestionSimilars < ActiveRecord::Migration[6.0]
  def change
    create_table :question_similars do |t|
      t.references :question
      t.string :similar_word
      t.timestamps
    end
  end
end
