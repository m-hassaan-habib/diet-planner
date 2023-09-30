if NaicsCode.count.zero?
  puts "seeding naics"

  path = File.join(File.dirname(__FILE__), "./seeds/naics.json")
  records = JSON.parse(File.read(path))

  records.each do |attributes|
    naics_attributes = {}
    attributes.each { |key, val| naics_attributes[key.downcase] = val }

    NaicsCode.create!(naics_attributes)
  end

  puts "naics code seeding complete"
else
  puts "naics code already seeded"
end

if Company.count.zero?
  puts "seeding companies"

  path = File.join(File.dirname(__FILE__), "./seeds/companies.json")
  records = JSON.parse(File.read(path))

  records.each do |attributes|
    company_attributes = attributes.except('id', 'addresses', 'naics_code')

    updated_addresses = attributes['addresses'].each { |hash| hash['address_type'] = hash.delete 'type' }
    company_attributes["addresses_attributes"] = updated_addresses

    company = Company.new company_attributes
    company.naics_code = NaicsCode.find_by(code: attributes["naics_code"])

    company.save!
  end

  puts "companies seeding complete"
else
  puts "companies already seeded"
end

User.create! name: "Manager User", email: "manager.user@gmail.com", password: "12345678"
User.create! name: "Admin User", email: "admin.user@gmail.com", password: "12345678"
