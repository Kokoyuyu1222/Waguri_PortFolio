class ThanksMailer < ApplicationMailer

	def send_mail(consumer)
    @consumer = consumer
    mail to: consumer.email, subject:"新規登録完了のご連絡"
  end
end
