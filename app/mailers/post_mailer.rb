class PostMailer < ActionMailer::Base
  default :from => 'admin@80000hours.org',
          :return_path => 'admin@80000hours.org'

  def new_comment(comment)
    @post_author = comment.post.user.name

    @comment = comment
    @commenter_name = (@comment.user ? comment.user.first_name : comment.name)

    @comment_post_title = comment.post.title
    @comment_post_url = post_url(comment.post)

    mail(:to => comment.post.user.email,
         :subject => "[80,000 Hours] New comment on #{comment.post.title}"
    )
  end
end