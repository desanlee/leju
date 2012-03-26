require 'rubygems'
require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

scheduler.every("1d") do
   allnotifications = Notification.all
   allnotifications.each do |an|
		if an.noti_type != "newfollow" then
			aMicropost = Micropost.find_by_id(an.target_id)
			if aMicropost then
				if aMicropost.schedual.strftime('%Y%m%d').to_i < Time.zone.now.strftime('%Y%m%d').to_i then
					an.delete
				end
			else
				an.delete
			end
		end
   end
end