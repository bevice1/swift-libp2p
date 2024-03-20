// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: relay-circuit.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

//
//  File.swift
//  
//
//  Created by Benedikt Kaiser on 06.02.24.

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

enum Status: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// zero value field required for proto3 compatibility
  case unused // = 0
  case ok // = 100
  case reservationRefused // = 200
  case resourceLimitExceeded // = 201
  case permissionDenied // = 202
  case connectionFailed // = 203
  case noReservation // = 204
  case malformedMessage // = 400
  case unexpectedMessage // = 401
  case UNRECOGNIZED(Int)

  init() {
    self = .unused
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unused
    case 100: self = .ok
    case 200: self = .reservationRefused
    case 201: self = .resourceLimitExceeded
    case 202: self = .permissionDenied
    case 203: self = .connectionFailed
    case 204: self = .noReservation
    case 400: self = .malformedMessage
    case 401: self = .unexpectedMessage
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unused: return 0
    case .ok: return 100
    case .reservationRefused: return 200
    case .resourceLimitExceeded: return 201
    case .permissionDenied: return 202
    case .connectionFailed: return 203
    case .noReservation: return 204
    case .malformedMessage: return 400
    case .unexpectedMessage: return 401
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Status: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Status] = [
    .unused,
    .ok,
    .reservationRefused,
    .resourceLimitExceeded,
    .permissionDenied,
    .connectionFailed,
    .noReservation,
    .malformedMessage,
    .unexpectedMessage,
  ]
}

#endif  // swift(>=4.2)

struct HopMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// This field is marked optional for backwards compatibility with proto2.
  /// Users should make sure to always set this.
  var type: HopMessage.TypeEnum {
    get {return _type ?? .reserve}
    set {_type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  var hasType: Bool {return self._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  mutating func clearType() {self._type = nil}

  var peer: Peer {
    get {return _peer ?? Peer()}
    set {_peer = newValue}
  }
  /// Returns true if `peer` has been explicitly set.
  var hasPeer: Bool {return self._peer != nil}
  /// Clears the value of `peer`. Subsequent reads from it will return its default value.
  mutating func clearPeer() {self._peer = nil}

  var reservation: Reservation {
    get {return _reservation ?? Reservation()}
    set {_reservation = newValue}
  }
  /// Returns true if `reservation` has been explicitly set.
  var hasReservation: Bool {return self._reservation != nil}
  /// Clears the value of `reservation`. Subsequent reads from it will return its default value.
  mutating func clearReservation() {self._reservation = nil}

  var limit: Limit {
    get {return _limit ?? Limit()}
    set {_limit = newValue}
  }
  /// Returns true if `limit` has been explicitly set.
  var hasLimit: Bool {return self._limit != nil}
  /// Clears the value of `limit`. Subsequent reads from it will return its default value.
  mutating func clearLimit() {self._limit = nil}

  var status: Status {
    get {return _status ?? .unused}
    set {_status = newValue}
  }
  /// Returns true if `status` has been explicitly set.
  var hasStatus: Bool {return self._status != nil}
  /// Clears the value of `status`. Subsequent reads from it will return its default value.
  mutating func clearStatus() {self._status = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum TypeEnum: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case reserve // = 0
    case connect // = 1
    case status // = 2
    case UNRECOGNIZED(Int)

    init() {
      self = .reserve
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .reserve
      case 1: self = .connect
      case 2: self = .status
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .reserve: return 0
      case .connect: return 1
      case .status: return 2
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}

  fileprivate var _type: HopMessage.TypeEnum? = nil
  fileprivate var _peer: Peer? = nil
  fileprivate var _reservation: Reservation? = nil
  fileprivate var _limit: Limit? = nil
  fileprivate var _status: Status? = nil
}

#if swift(>=4.2)

extension HopMessage.TypeEnum: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [HopMessage.TypeEnum] = [
    .reserve,
    .connect,
    .status,
  ]
}

#endif  // swift(>=4.2)

struct StopMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// This field is marked optional for backwards compatibility with proto2.
  /// Users should make sure to always set this.
  var type: StopMessage.TypeEnum {
    get {return _type ?? .connect}
    set {_type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  var hasType: Bool {return self._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  mutating func clearType() {self._type = nil}

  var peer: Peer {
    get {return _peer ?? Peer()}
    set {_peer = newValue}
  }
  /// Returns true if `peer` has been explicitly set.
  var hasPeer: Bool {return self._peer != nil}
  /// Clears the value of `peer`. Subsequent reads from it will return its default value.
  mutating func clearPeer() {self._peer = nil}

  var limit: Limit {
    get {return _limit ?? Limit()}
    set {_limit = newValue}
  }
  /// Returns true if `limit` has been explicitly set.
  var hasLimit: Bool {return self._limit != nil}
  /// Clears the value of `limit`. Subsequent reads from it will return its default value.
  mutating func clearLimit() {self._limit = nil}

  var status: Status {
    get {return _status ?? .unused}
    set {_status = newValue}
  }
  /// Returns true if `status` has been explicitly set.
  var hasStatus: Bool {return self._status != nil}
  /// Clears the value of `status`. Subsequent reads from it will return its default value.
  mutating func clearStatus() {self._status = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum TypeEnum: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case connect // = 0
    case status // = 1
    case UNRECOGNIZED(Int)

    init() {
      self = .connect
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .connect
      case 1: self = .status
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .connect: return 0
      case .status: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}

  fileprivate var _type: StopMessage.TypeEnum? = nil
  fileprivate var _peer: Peer? = nil
  fileprivate var _limit: Limit? = nil
  fileprivate var _status: Status? = nil
}

#if swift(>=4.2)

extension StopMessage.TypeEnum: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [StopMessage.TypeEnum] = [
    .connect,
    .status,
  ]
}

#endif  // swift(>=4.2)

struct Peer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// This field is marked optional for backwards compatibility with proto2.
  /// Users should make sure to always set this.
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

struct Reservation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// This field is marked optional for backwards compatibility with proto2.
  /// Users should make sure to always set this.
  var expire: UInt64 {
    get {return _expire ?? 0}
    set {_expire = newValue}
  }
  /// Returns true if `expire` has been explicitly set.
  var hasExpire: Bool {return self._expire != nil}
  /// Clears the value of `expire`. Subsequent reads from it will return its default value.
  mutating func clearExpire() {self._expire = nil}

  /// relay addrs for reserving peer
  var addrs: [Data] = []

  /// reservation voucher
  var voucher: Data {
    get {return _voucher ?? Data()}
    set {_voucher = newValue}
  }
  /// Returns true if `voucher` has been explicitly set.
  var hasVoucher: Bool {return self._voucher != nil}
  /// Clears the value of `voucher`. Subsequent reads from it will return its default value.
  mutating func clearVoucher() {self._voucher = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _expire: UInt64? = nil
  fileprivate var _voucher: Data? = nil
}

struct Limit {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// seconds
  var duration: UInt32 {
    get {return _duration ?? 0}
    set {_duration = newValue}
  }
  /// Returns true if `duration` has been explicitly set.
  var hasDuration: Bool {return self._duration != nil}
  /// Clears the value of `duration`. Subsequent reads from it will return its default value.
  mutating func clearDuration() {self._duration = nil}

  /// bytes
  var data: UInt64 {
    get {return _data ?? 0}
    set {_data = newValue}
  }
  /// Returns true if `data` has been explicitly set.
  var hasData: Bool {return self._data != nil}
  /// Clears the value of `data`. Subsequent reads from it will return its default value.
  mutating func clearData() {self._data = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _duration: UInt32? = nil
  fileprivate var _data: UInt64? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Status: @unchecked Sendable {}
extension HopMessage: @unchecked Sendable {}
extension HopMessage.TypeEnum: @unchecked Sendable {}
extension StopMessage: @unchecked Sendable {}
extension StopMessage.TypeEnum: @unchecked Sendable {}
extension Peer: @unchecked Sendable {}
extension Reservation: @unchecked Sendable {}
extension Limit: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Status: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "UNUSED"),
    100: .same(proto: "OK"),
    200: .same(proto: "RESERVATION_REFUSED"),
    201: .same(proto: "RESOURCE_LIMIT_EXCEEDED"),
    202: .same(proto: "PERMISSION_DENIED"),
    203: .same(proto: "CONNECTION_FAILED"),
    204: .same(proto: "NO_RESERVATION"),
    400: .same(proto: "MALFORMED_MESSAGE"),
    401: .same(proto: "UNEXPECTED_MESSAGE"),
  ]
}

extension HopMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "HopMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "peer"),
    3: .same(proto: "reservation"),
    4: .same(proto: "limit"),
    5: .same(proto: "status"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self._type) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._peer) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._reservation) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._limit) }()
      case 5: try { try decoder.decodeSingularEnumField(value: &self._status) }()
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
    try { if let v = self._peer {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._reservation {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._limit {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._status {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: HopMessage, rhs: HopMessage) -> Bool {
    if lhs._type != rhs._type {return false}
    if lhs._peer != rhs._peer {return false}
    if lhs._reservation != rhs._reservation {return false}
    if lhs._limit != rhs._limit {return false}
    if lhs._status != rhs._status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension HopMessage.TypeEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "RESERVE"),
    1: .same(proto: "CONNECT"),
    2: .same(proto: "STATUS"),
  ]
}

extension StopMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "StopMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "peer"),
    3: .same(proto: "limit"),
    4: .same(proto: "status"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self._type) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._peer) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._limit) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self._status) }()
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
    try { if let v = self._peer {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._limit {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._status {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: StopMessage, rhs: StopMessage) -> Bool {
    if lhs._type != rhs._type {return false}
    if lhs._peer != rhs._peer {return false}
    if lhs._limit != rhs._limit {return false}
    if lhs._status != rhs._status {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension StopMessage.TypeEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "CONNECT"),
    1: .same(proto: "STATUS"),
  ]
}

extension Peer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Peer"
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

  static func ==(lhs: Peer, rhs: Peer) -> Bool {
    if lhs._id != rhs._id {return false}
    if lhs.addrs != rhs.addrs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Reservation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Reservation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "expire"),
    2: .same(proto: "addrs"),
    3: .same(proto: "voucher"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self._expire) }()
      case 2: try { try decoder.decodeRepeatedBytesField(value: &self.addrs) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self._voucher) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._expire {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 1)
    } }()
    if !self.addrs.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.addrs, fieldNumber: 2)
    }
    try { if let v = self._voucher {
      try visitor.visitSingularBytesField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Reservation, rhs: Reservation) -> Bool {
    if lhs._expire != rhs._expire {return false}
    if lhs.addrs != rhs.addrs {return false}
    if lhs._voucher != rhs._voucher {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Limit: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "Limit"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "duration"),
    2: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self._duration) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self._data) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._duration {
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._data {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Limit, rhs: Limit) -> Bool {
    if lhs._duration != rhs._duration {return false}
    if lhs._data != rhs._data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
