require "faker"
class InquiryMailerPreview < ActionMailer::Preview


    def custom_work

        inquiry_params={firstName: Faker::Name.first_name, lastName: Faker::Name.last_name,
        email: "#{Faker::Internet.email}", 
        budget: Faker::Number.between(from: 125.0, to: 2222.50), diamond: Faker::Lorem.paragraph(sentence_count: 5, supplemental: false, random_sentences_to_add: 4), 
        material:"gold",
         description: Faker::Lorem.paragraph(sentence_count: 20, supplemental: false, random_sentences_to_add: 4)}

        InquiryMailer.custom_jewelry(inquiry_params)
    end
end
