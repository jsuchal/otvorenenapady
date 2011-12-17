module TimelineHelper
  def gravatar_for(email, size = 80)
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5::hexdigest(email)}?s=#{size}", alt: '', size: "#{size}x#{size}")
  end
end
