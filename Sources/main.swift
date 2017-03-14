import CSDL2

if SDL_Init(UInt32(SDL_INIT_VIDEO)) == -1 {
	print("Error while initialzing SDL")
	exit(0)
}

SDL_CreateWindow("Test", 50, 50, 300, 300, 0)

var running = true

while running {
	var eventPointer = UnsafeMutablePointer<SDL_Event>.allocate(capacity: 1)
	while SDL_PollEvent(eventPointer) == 1 {
		let event : SDL_Event = eventPointer.pointee
		switch SDL_EventType(rawValue:event.type) {
			case SDL_FINGERUP:
				running = false
			default:
			break
		}
	} 
}

SDL_Quit()
