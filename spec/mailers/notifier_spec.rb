require "spec_helper"

describe Notifier do
  it "correctly sets the reply-to" do
    comment = Factory(:comment)
    mail = ActionMailer::Base.deliveries.last
    mail.from.should eql(["pceruby+#{comment.project.id}+" + "#{comment.ticket.id}@gmail.com"])
  end  
end
