# encoding: utf-8
module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "乐聚 Let's Enjoy - leju.org"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
