bookings = [{
  "checkin": "2017-10-1",
  "checkout": "2017-10-3",
  "id": 1
},
{
  "checkin": "2017-10-1",
  "checkout": "2017-10-4",
  "id": 2
},
{
  "checkin": "2017-10-3",
  "checkout": "2017-10-6",
  "id": 3
},
{
  "checkin": "2017-10-3",
  "checkout": "2017-10-8",
  "id": 4
},
{
  "checkin": "2017-10-4",
  "checkout": "2017-10-8",
  "id": 5
},
{
  "checkin": "2017-10-8",
  "checkout": "2017-10-12",
  "id": 6
},
{
  "checkin": "2017-10-9",
  "checkout": "2017-10-20",
  "id": 7
},
{
  "checkin": "2017-10-15",
  "checkout": "2017-10-20",
  "id": 8
},
{
  "checkin": "2017-10-21",
  "checkout": "2017-10-30",
  "id": 9
}]

num_of_rooms = 3

def change_checkin_to_int(check)
    if check[9] == nil
        date = check[8]
    else
        date = check[8] + check[9]
    end
    date = date.to_i
end

def assign_rooms(bookings, num_of_rooms)
    # initialise an array of x number of arrays, where x = num_of_rooms, this will represent the rooms
    rooms = []
    num_of_rooms.times do
        rooms.push([])
    end
    # for each room
    rooms.each do |room|
    # start by putting in any booking on the first day
        date = 0
        while date <= 31 do
    # if none of the bookings fit, move on to the next day
            date += 1
            bookings.each do |booking|
                if date == change_checkin_to_int(booking[:checkin])
                    room.push(booking)
    # determine the end of the booking and put another booking on the same day
                    date = change_checkin_to_int(booking[:checkout])
    # once the booking is placed, remove it from the array
                    bookings.delete(booking)
                end
            end
        end
    # until you reach the last day of the month, then move on to the next room
    end
end

assign_rooms(bookings, num_of_rooms).each do |room|
    room.each do |booking|
        print booking[:id]
        print ","
    end
    puts ""
end

# result
# [
#     [1,3,6,8,9],
#     [2,5,7],
#     [4]
# ]