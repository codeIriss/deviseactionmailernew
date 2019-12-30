class CommentsMailbox < ApplicationMailbox
  def process
    task = find_task(mail.subject)
    update_comments(task, mail.decoded)
  rescue
    # Proper error handler here.
  end

  private

  def update_comments(task, comment_string)
    task.comments.create!(note: comment_string)
  end

  def find_task(subject)
    task_id = subject.split("-").last.to_i
    Task.find(task_id)
  end
end
