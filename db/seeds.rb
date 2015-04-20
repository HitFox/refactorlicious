# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ExerciseCategory.find_or_create_by(name: "Extract Method").tap do |ec|
  ec.description = <<TEXT
  Extract Method is one of the most common refactorings.

    It's preferred to have short, well-named methods for several reasons.

First, it increases the chances that other methods can use a method when the method is finely grained. Second, it allows the higher-level methods to read more like a series of comments.

1. Create a new method, and name it after the intention of the method (name it by what it does, not by how it does it).

2. Copy the extracted code from the source method into the new target method.

3. Scan the extracted code for references to any variables that are local in scope to the source method. These are local variables and parameters to the method.

4. Replace the extracted code in the source method with a call to the target method.
TEXT
  ec.example = <<'EXAMPLE'
def print_owing(amount)
  print_banner
  puts "name: #{@name}"
  puts "amount: #{amount}"
end

# ||
# \/

def print_owing(amount)
  print_banner
  print_details amount
end

def print_details(amount)
  puts "name: #{@name}"
  puts "amount: #{amount}"
end
EXAMPLE
  ec.save
end

ExerciseCategory.find_or_create_by(name: "Inline Method").tap do |ec|
  ec.description = <<TEXT
Sometimes you come across a method in which the body is as clear as the name. In this case it makes sense to get rid of the method

1. Check that the method is not polymorphic.

2. Find all calls to the method.

3.Replace each call with the method body.
TEXT
  ec.example = <<'EXAMPLE'
def get_rating
  more_than_five_late_deliveries ? 2 : 1
end

def more_than_five_late_deliveries
  @number_of_late_deliveries > 5
end

# ||
# \/

def get_rating
  @number_of_late_deliveries > 5 ? 2 : 1
end
EXAMPLE
  ec.save
end

ExerciseCategory.find_or_create_by(name: "Introduce Explaining Variable").tap do |ec|
  ec.description = <<TEXT
Expressions can become complex and hard to read. In such situations temporary variables can be helpful to break down the expression into something more manageable.

1. Assign a temporary variable to the result of part of the complex expression.

2. Replace the result part of the expression with the value of the temp.
TEXT
 ec.example = <<'EXAMPLE'
if (platform.upcase.index("MAC") &&
  browser.upcase.index("IE") &&
  initialized? &&
  resize > 0
  )
  # do something
end

# ||
# \/

is_mac_os = platform.upcase.index("MAC")
is_ie_browser = browser.upcase.index("IE")
was_resized = resize > 0
if (is_mac_os && is_ie_browser && initialized? && was_resized)
  # do something
end
EXAMPLE
  ec.save
end

Exercise.create.tap do |e|
  e.id = 1
  e.points = 15
  e.exercise_category_id = ExerciseCategory.find_by_name("Introduce Explaining Variable").id
  e.save
end

Exercise.create.tap do |e|
  e.id = 2
  e.points = 10
  e.exercise_category_id = ExerciseCategory.find_by_name("Inline Method").id
  e.save
end

Exercise.create.tap do |e|
  e.id = 3
  e.points = 10
  e.exercise_category_id = ExerciseCategory.find_by_name("Inline Method").id
  e.save
end

Exercise.create.tap do |e|
  e.id = 4
  e.points = 10
  e.exercise_category_id = ExerciseCategory.find_by_name("Inline Method").id
  e.save
end

Exercise.create.tap do |e|
  e.id = 5
  e.points = 15
  e.exercise_category_id = ExerciseCategory.find_by_name("Extract Method").id
  e.save
end

Exercise.create.tap do |e|
  e.id = 6
  e.points = 25
  e.exercise_category_id = ExerciseCategory.find_by_name("Extract Method").id
  e.save
end
