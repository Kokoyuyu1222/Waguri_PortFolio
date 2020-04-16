class ThanksMailer < ApplicationMailer
	def send_mail_consumer(consumer,fermer)
	    @consumer = consumer
	    @fermer = fermer
	    mail to: consumer.email, from: fermer.email, subject:"購入情報のご連絡"
    end
    def send_mail_fermer(fermer)
	    @fermer = fermer
	    mail to: fermer.email, subject:"注文情報ののご連絡"
    end
end
