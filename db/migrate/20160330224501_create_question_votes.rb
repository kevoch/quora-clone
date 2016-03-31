class CreateQuestionVotes < ActiveRecord::Migration
  

    def change
      create_table :question_votes do |t|
      t.integer :question_vote_count
      t.integer :question_id
      t.integer :user_id
      t.timestamps
      end
    end
end