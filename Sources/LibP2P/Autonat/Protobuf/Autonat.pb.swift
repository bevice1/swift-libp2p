// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Autonat.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Message {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var type: Message.MessageType {
    get {return _type ?? .dial}
    set {_type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  var hasType: Bool {return self._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  mutating func clearType() {self._type = nil}

  var dial: Message.Dial {
    get {return _dial ?? Message.Dial()}
    set {_dial = newValue}
  }
  /// Returns true if `dial` has been explicitly set.
  var hasDial: Bool {return self._dial != nil}
  /// Clears the value of `dial`. Subsequent reads from it will return its default value.
  mutating func clearDial() {self._dial = nil}

  var dialResponse: Message.DialResponse {
    get {return _dialResponse ?? Message.DialResponse()}
    set {_dialResponse = newValue}
  }
  /// Returns true if `dialResponse` has been explicitly set.
  var hasDialResponse: Bool {return self._dialResponse != nil}
  /// Clears the value of `dialResponse`. Subsequent reads from it will return its default value.
  mutating func clearDialResponse() {self._dialResponse = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum MessageType: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case dial // = 0
    case dialResponse // = 1

    init() {
      self = .dial
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .dial
      case 1: self = .dialResponse
      default: return nil
      }
    }

    var rawValue: Int {
      switch self {
      case .dial: return 0
      case .dialResponse: return 1
      }
    }

  }

  enum ResponseStatus: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case ok // = 0
    case eDialError // = 100
    case eDialRefused // = 101
    case eBadRequest // = 200
    case eInternalError // = 300

    init() {
      self = .ok
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .ok
      case 100: self = .eDialError
      case 101: self = .eDialRefused
      case 200: self = .eBadRequest
      case 300: self = .eInternalError
      default: return nil
      }
    }

    var rawValue: Int {
      switch self {
      case .ok: return 0
      case .eDialError: return 100
      case .eDialRefused: return 101
      case .eBadRequest: return 200
      case .eInternalError: return 300
      }
    }

  }

  struct PeerInfo {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var id: Data {
      get {return _id ?? Data()}
      set {_id = newValue}
    }
    /// Returns true if `id` has been explicitly set.
    var hasID: Bool {return self._id != nil}
    /// Clears the value of `id`. Subsequent reads from it will return its default value.
    mutating func clearID() {self._id = nil}

    var addrs: [Data] = []

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    fileprivate var _id: Data? = nil
  }

  struct Dial {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var peer: Message.PeerInfo {
      get {return _peer ?? Message.PeerInfo()}
      set {_peer = newValue}
    }
    /// Returns true if `peer` has been explicitly set.
    var hasPeer: Bool {return self._peer != nil}
    /// Clears the value of `peer`. Subsequent reads from it will return its default value.
    mutating func clearPeer() {self._peer = nil}

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    fileprivate var _peer: Message.PeerInfo? = nil
  }

  struct DialResponse {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Message.ResponseStatus {
      get {return _status ?? .ok}
      set {_status = newValue}
    }
    /// Returns true if `status` has been explicitly set.
    var hasStatus: Bool {return self._status != nil}
    /// Clears the value of `status`. Subsequent reads from it will return its default value.
    mutating func clearStatus() {self._status = nil}

    var statusText: String {
      get {return _statusText ?? String()}
      set {_statusText = newValue}
    }
    /// Returns true if `statusText` has been explicitly set.
    var hasStatusText: Bool {return self._statusText != nil}
    /// Clears the value of `statusText`. Subsequent reads from it will return its default value.
    mutating func clearStatusText() {self._statusText = nil}

    var addr: Data {
      get {return _addr ?? Data()}
      set {_addr = newValue}
    }
    /// Returns true if `addr` has been explicitly set.
    var hasAddr: Bool {return self._addr != nil}
    /// Clears the value of `addr`. Subsequent reads from it will return its default value.
    mutating func clearAddr() {self._addr = nil}

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    fileprivate var _status: Message.ResponseStatus? = nil
    fileprivate var _statusText: String? = nil
    fileprivate var _addr: Data? = nil
  }

  init() {}

  fileprivate var _type: Message.MessageType? = nil
  fileprivate var _dial: Message.Dial? = nil
  fileprivate var _dialResponse: Message.DialResponse? = nil
}

#if swift(>=4.2)

extension Message.MessageType: CaseIterable {
  // Support synthesized by the compiler.
}

extension Message.ResponseStatus: CaseIterable {
  // Support synthesized by the compiler.
}

#endif  // swift(>=4.2)

#if swift(>=5.5) && canImport(_Concurrency)
extension Message: @unchecked Sendable {}
extension Message.MessageType: @unchecked Sendable {}
extension Message.ResponseStatus: @unchecked Sendable {}
extension Message.PeerInfo: @unchecked Sendable {}
extension Message.Dial: @unchecked Sendable {}
extension Message.DialResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Message: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Message"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "dial"),
    3: .same(proto: "dialResponse"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self._type) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._dial) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._dialResponse) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._type {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._dial {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._dialResponse {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Message, rhs: Message) -> Bool {
    if lhs._type != rhs._type {return false}
    if lhs._dial != rhs._dial {return false}
    if lhs._dialResponse != rhs._dialResponse {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Message.MessageType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DIAL"),
    1: .same(proto: "DIAL_RESPONSE"),
  ]
}

extension Message.ResponseStatus: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "OK"),
    100: .same(proto: "E_DIAL_ERROR"),
    101: .same(proto: "E_DIAL_REFUSED"),
    200: .same(proto: "E_BAD_REQUEST"),
    300: .same(proto: "E_INTERNAL_ERROR"),
  ]
}

extension Message.PeerInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Message.protoMessageName + ".PeerInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "addrs"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self._id) }()
      case 2: try { try decoder.decodeRepeatedBytesField(value: &self.addrs) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._id {
      try visitor.visitSingularBytesField(value: v, fieldNumber: 1)
    } }()
    if !self.addrs.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.addrs, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Message.PeerInfo, rhs: Message.PeerInfo) -> Bool {
    if lhs._id != rhs._id {return false}
    if lhs.addrs != rhs.addrs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Message.Dial: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Message.protoMessageName + ".Dial"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "peer"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._peer) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._peer {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Message.Dial, rhs: Message.Dial) -> Bool {
    if lhs._peer != rhs._peer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Message.DialResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Message.protoMessageName + ".DialResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "status"),
    2: .same(proto: "statusText"),
    3: .same(proto: "addr"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self._status) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self._statusText) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self._addr) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._status {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._statusText {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._addr {
      try visitor.visitSingularBytesField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Message.DialResponse, rhs: Message.DialResponse) -> Bool {
    if lhs._status != rhs._status {return false}
    if lhs._statusText != rhs._statusText {return false}
    if lhs._addr != rhs._addr {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
