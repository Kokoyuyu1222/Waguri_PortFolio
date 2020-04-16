class SignUpMailer < ApplicationMailer
  def send_mail_consumer(consumer)
    @consumer = consumer
    mail to: consumer.email, subject:"新規登録完了のご連絡"
  end
  def send_mail_fermer(fermer)
    @fermer = fermer
    mail to: fermer.email, subject:"新規登録完了のご連絡"
  end
end
