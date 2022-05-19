module AhoyEventsHelper
  def event_name_detail(event)
    if Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['comfy-blog-page-visit']
      blog_post = Comfy::Blog::Post.find(event.properties['comfy_blog_post_id'])

      comfy_blog_post_path(year: blog_post.year, month: blog_post.month, slug: blog_post.slug)
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['comfy-cms-page-update']
      page = Comfy::Cms::Page.find(event.properties['page_id'])
      page_info = page.full_path == '/' ? 'root' : page.full_path

      page_info
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['comfy-cms-page-visit']
      page = Comfy::Cms::Page.find(event.properties['comfy_cms_page_id'])
      page_info = page.full_path == '/' ? 'root' : page.full_path

      page_info
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['comfy-file-update']
      file = Comfy::Cms::File.find(event.properties['file_id'])

      file.label
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['comfy-user-update']
      user = User.find(event.properties['edited_user_id'])
      user_info = user.name.present? ? "#{user.name}: #{user.email}" : user.email

      user_info
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['email-visit']
      message_thread = MessageThread.find(event.properties['message_thread_id'])

      message_thread.subject
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['forum-post-update']
      forum_post = ForumPost.find(event.properties['forum_post_id'])
      forum_post_info = "#{simple_discussion.forum_thread_path(id: forum_post.forum_thread.slug)}#forum_post_#{forum_post.id}"

      forum_post_info
    elsif Ahoy::Event::SYSTEM_EVENTS[event.name] == Ahoy::Event::SYSTEM_EVENTS['forum-thread-visit']
      forum_thread = ForumThread.find(event.properties['forum_thread_id'])

      simple_discussion.forum_thread_path(id: forum_thread.slug)
    end
  end

end
