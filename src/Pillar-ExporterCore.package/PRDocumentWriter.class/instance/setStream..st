initialize-release
setStream: aStream
	stream := PROutputStream on: aStream.
	configuration ifNotNil: [ stream configuration: configuration ]