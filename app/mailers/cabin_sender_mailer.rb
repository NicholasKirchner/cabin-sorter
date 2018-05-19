class CabinSenderMailer < ApplicationMailer
  
  def send_cabin_arrangement(arrangement, email)
    attachments['cabins.csv'] = arrangement
    mail( to: email,
          subject: "Your cabin arrangement" )
  end

end
