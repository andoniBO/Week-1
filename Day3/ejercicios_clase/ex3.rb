hash = {
	:wat => [
		1, 
		2, 
		{
			:wut => [
				1,
				[
					[
						1,
						2,
						3,
						4,
						5,
						6,
						7,
						8,
						9,
						{:bbq => "solomillo"}
					]
				]
			]
		}
	]
}

puts hash[:wat][2][:wut][1][0][9][:bbq]

arr = [
	[
		1,
		2,
		3,
		4,
		5,
		{:secret => {
			:unlock => [1, "Hey jude"]
			}
		}
	]
]

puts arr[0][5][:secret][:unlock][1]