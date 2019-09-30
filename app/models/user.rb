class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :todos
  has_many :tasks, through: :todos
after_create :cargar
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def cargar
    Task.all.each do |task|
      Todo.create(
        task_id: task.id,
        user_id: self.id #(se pone self, porque el modelo tiene como clase user y no se puede repetir)
      )
    end
  end


end
