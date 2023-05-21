// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Moment")));
bytes32 constant MomentTableId = _tableId;

struct MomentData {
  uint64 date;
  uint64 startTime;
  uint64 endTime;
  bool isLive;
  bytes32 owner;
  string location;
  string locationType;
  string title;
  string description;
  string nftMetadata;
}

library Moment {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](10);
    _schema[0] = SchemaType.UINT64;
    _schema[1] = SchemaType.UINT64;
    _schema[2] = SchemaType.UINT64;
    _schema[3] = SchemaType.BOOL;
    _schema[4] = SchemaType.BYTES32;
    _schema[5] = SchemaType.STRING;
    _schema[6] = SchemaType.STRING;
    _schema[7] = SchemaType.STRING;
    _schema[8] = SchemaType.STRING;
    _schema[9] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](10);
    _fieldNames[0] = "date";
    _fieldNames[1] = "startTime";
    _fieldNames[2] = "endTime";
    _fieldNames[3] = "isLive";
    _fieldNames[4] = "owner";
    _fieldNames[5] = "location";
    _fieldNames[6] = "locationType";
    _fieldNames[7] = "title";
    _fieldNames[8] = "description";
    _fieldNames[9] = "nftMetadata";
    return ("Moment", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get date */
  function getDate(bytes32 key) internal view returns (uint64 date) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Get date (using the specified store) */
  function getDate(IStore _store, bytes32 key) internal view returns (uint64 date) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Set date */
  function setDate(bytes32 key, uint64 date) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((date)));
  }

  /** Set date (using the specified store) */
  function setDate(IStore _store, bytes32 key, uint64 date) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((date)));
  }

  /** Get startTime */
  function getStartTime(bytes32 key) internal view returns (uint64 startTime) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Get startTime (using the specified store) */
  function getStartTime(IStore _store, bytes32 key) internal view returns (uint64 startTime) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Set startTime */
  function setStartTime(bytes32 key, uint64 startTime) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((startTime)));
  }

  /** Set startTime (using the specified store) */
  function setStartTime(IStore _store, bytes32 key, uint64 startTime) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((startTime)));
  }

  /** Get endTime */
  function getEndTime(bytes32 key) internal view returns (uint64 endTime) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Get endTime (using the specified store) */
  function getEndTime(IStore _store, bytes32 key) internal view returns (uint64 endTime) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Set endTime */
  function setEndTime(bytes32 key, uint64 endTime) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((endTime)));
  }

  /** Set endTime (using the specified store) */
  function setEndTime(IStore _store, bytes32 key, uint64 endTime) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((endTime)));
  }

  /** Get isLive */
  function getIsLive(bytes32 key) internal view returns (bool isLive) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Get isLive (using the specified store) */
  function getIsLive(IStore _store, bytes32 key) internal view returns (bool isLive) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (_toBool(uint8(Bytes.slice1(_blob, 0))));
  }

  /** Set isLive */
  function setIsLive(bytes32 key, bool isLive) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((isLive)));
  }

  /** Set isLive (using the specified store) */
  function setIsLive(IStore _store, bytes32 key, bool isLive) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((isLive)));
  }

  /** Get owner */
  function getOwner(bytes32 key) internal view returns (bytes32 owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get owner (using the specified store) */
  function getOwner(IStore _store, bytes32 key) internal view returns (bytes32 owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set owner */
  function setOwner(bytes32 key, bytes32 owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 4, abi.encodePacked((owner)));
  }

  /** Set owner (using the specified store) */
  function setOwner(IStore _store, bytes32 key, bytes32 owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 4, abi.encodePacked((owner)));
  }

  /** Get location */
  function getLocation(bytes32 key) internal view returns (string memory location) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5);
    return (string(_blob));
  }

  /** Get location (using the specified store) */
  function getLocation(IStore _store, bytes32 key) internal view returns (string memory location) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5);
    return (string(_blob));
  }

  /** Set location */
  function setLocation(bytes32 key, string memory location) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 5, bytes((location)));
  }

  /** Set location (using the specified store) */
  function setLocation(IStore _store, bytes32 key, string memory location) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 5, bytes((location)));
  }

  /** Get the length of location */
  function lengthLocation(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 5, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of location (using the specified store) */
  function lengthLocation(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 5, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of location (unchecked, returns invalid data if index overflows) */
  function getItemLocation(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 5, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of location (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemLocation(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 5, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to location */
  function pushLocation(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 5, bytes((_slice)));
  }

  /** Push a slice to location (using the specified store) */
  function pushLocation(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 5, bytes((_slice)));
  }

  /** Pop a slice from location */
  function popLocation(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 5, 1);
  }

  /** Pop a slice from location (using the specified store) */
  function popLocation(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 5, 1);
  }

  /** Update a slice of location at `_index` */
  function updateLocation(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 5, _index * 1, bytes((_slice)));
  }

  /** Update a slice of location (using the specified store) at `_index` */
  function updateLocation(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 5, _index * 1, bytes((_slice)));
  }

  /** Get locationType */
  function getLocationType(bytes32 key) internal view returns (string memory locationType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 6);
    return (string(_blob));
  }

  /** Get locationType (using the specified store) */
  function getLocationType(IStore _store, bytes32 key) internal view returns (string memory locationType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 6);
    return (string(_blob));
  }

  /** Set locationType */
  function setLocationType(bytes32 key, string memory locationType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 6, bytes((locationType)));
  }

  /** Set locationType (using the specified store) */
  function setLocationType(IStore _store, bytes32 key, string memory locationType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 6, bytes((locationType)));
  }

  /** Get the length of locationType */
  function lengthLocationType(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 6, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of locationType (using the specified store) */
  function lengthLocationType(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 6, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of locationType (unchecked, returns invalid data if index overflows) */
  function getItemLocationType(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 6, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of locationType (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemLocationType(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 6, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to locationType */
  function pushLocationType(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 6, bytes((_slice)));
  }

  /** Push a slice to locationType (using the specified store) */
  function pushLocationType(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 6, bytes((_slice)));
  }

  /** Pop a slice from locationType */
  function popLocationType(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 6, 1);
  }

  /** Pop a slice from locationType (using the specified store) */
  function popLocationType(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 6, 1);
  }

  /** Update a slice of locationType at `_index` */
  function updateLocationType(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 6, _index * 1, bytes((_slice)));
  }

  /** Update a slice of locationType (using the specified store) at `_index` */
  function updateLocationType(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 6, _index * 1, bytes((_slice)));
  }

  /** Get title */
  function getTitle(bytes32 key) internal view returns (string memory title) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 7);
    return (string(_blob));
  }

  /** Get title (using the specified store) */
  function getTitle(IStore _store, bytes32 key) internal view returns (string memory title) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 7);
    return (string(_blob));
  }

  /** Set title */
  function setTitle(bytes32 key, string memory title) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 7, bytes((title)));
  }

  /** Set title (using the specified store) */
  function setTitle(IStore _store, bytes32 key, string memory title) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 7, bytes((title)));
  }

  /** Get the length of title */
  function lengthTitle(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 7, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of title (using the specified store) */
  function lengthTitle(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 7, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of title (unchecked, returns invalid data if index overflows) */
  function getItemTitle(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 7, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of title (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemTitle(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 7, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to title */
  function pushTitle(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 7, bytes((_slice)));
  }

  /** Push a slice to title (using the specified store) */
  function pushTitle(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 7, bytes((_slice)));
  }

  /** Pop a slice from title */
  function popTitle(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 7, 1);
  }

  /** Pop a slice from title (using the specified store) */
  function popTitle(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 7, 1);
  }

  /** Update a slice of title at `_index` */
  function updateTitle(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 7, _index * 1, bytes((_slice)));
  }

  /** Update a slice of title (using the specified store) at `_index` */
  function updateTitle(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 7, _index * 1, bytes((_slice)));
  }

  /** Get description */
  function getDescription(bytes32 key) internal view returns (string memory description) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 8);
    return (string(_blob));
  }

  /** Get description (using the specified store) */
  function getDescription(IStore _store, bytes32 key) internal view returns (string memory description) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 8);
    return (string(_blob));
  }

  /** Set description */
  function setDescription(bytes32 key, string memory description) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 8, bytes((description)));
  }

  /** Set description (using the specified store) */
  function setDescription(IStore _store, bytes32 key, string memory description) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 8, bytes((description)));
  }

  /** Get the length of description */
  function lengthDescription(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 8, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of description (using the specified store) */
  function lengthDescription(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 8, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of description (unchecked, returns invalid data if index overflows) */
  function getItemDescription(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 8, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of description (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemDescription(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 8, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to description */
  function pushDescription(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 8, bytes((_slice)));
  }

  /** Push a slice to description (using the specified store) */
  function pushDescription(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 8, bytes((_slice)));
  }

  /** Pop a slice from description */
  function popDescription(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 8, 1);
  }

  /** Pop a slice from description (using the specified store) */
  function popDescription(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 8, 1);
  }

  /** Update a slice of description at `_index` */
  function updateDescription(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 8, _index * 1, bytes((_slice)));
  }

  /** Update a slice of description (using the specified store) at `_index` */
  function updateDescription(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 8, _index * 1, bytes((_slice)));
  }

  /** Get nftMetadata */
  function getNftMetadata(bytes32 key) internal view returns (string memory nftMetadata) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 9);
    return (string(_blob));
  }

  /** Get nftMetadata (using the specified store) */
  function getNftMetadata(IStore _store, bytes32 key) internal view returns (string memory nftMetadata) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 9);
    return (string(_blob));
  }

  /** Set nftMetadata */
  function setNftMetadata(bytes32 key, string memory nftMetadata) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setField(_tableId, _keyTuple, 9, bytes((nftMetadata)));
  }

  /** Set nftMetadata (using the specified store) */
  function setNftMetadata(IStore _store, bytes32 key, string memory nftMetadata) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setField(_tableId, _keyTuple, 9, bytes((nftMetadata)));
  }

  /** Get the length of nftMetadata */
  function lengthNftMetadata(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 9, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of nftMetadata (using the specified store) */
  function lengthNftMetadata(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 9, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of nftMetadata (unchecked, returns invalid data if index overflows) */
  function getItemNftMetadata(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 9, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of nftMetadata (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemNftMetadata(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 9, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to nftMetadata */
  function pushNftMetadata(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.pushToField(_tableId, _keyTuple, 9, bytes((_slice)));
  }

  /** Push a slice to nftMetadata (using the specified store) */
  function pushNftMetadata(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.pushToField(_tableId, _keyTuple, 9, bytes((_slice)));
  }

  /** Pop a slice from nftMetadata */
  function popNftMetadata(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.popFromField(_tableId, _keyTuple, 9, 1);
  }

  /** Pop a slice from nftMetadata (using the specified store) */
  function popNftMetadata(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.popFromField(_tableId, _keyTuple, 9, 1);
  }

  /** Update a slice of nftMetadata at `_index` */
  function updateNftMetadata(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.updateInField(_tableId, _keyTuple, 9, _index * 1, bytes((_slice)));
  }

  /** Update a slice of nftMetadata (using the specified store) at `_index` */
  function updateNftMetadata(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.updateInField(_tableId, _keyTuple, 9, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (MomentData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (MomentData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    bytes32 key,
    uint64 date,
    uint64 startTime,
    uint64 endTime,
    bool isLive,
    bytes32 owner,
    string memory location,
    string memory locationType,
    string memory title,
    string memory description,
    string memory nftMetadata
  ) internal {
    bytes memory _data = encode(
      date,
      startTime,
      endTime,
      isLive,
      owner,
      location,
      locationType,
      title,
      description,
      nftMetadata
    );

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    bytes32 key,
    uint64 date,
    uint64 startTime,
    uint64 endTime,
    bool isLive,
    bytes32 owner,
    string memory location,
    string memory locationType,
    string memory title,
    string memory description,
    string memory nftMetadata
  ) internal {
    bytes memory _data = encode(
      date,
      startTime,
      endTime,
      isLive,
      owner,
      location,
      locationType,
      title,
      description,
      nftMetadata
    );

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, MomentData memory _table) internal {
    set(
      key,
      _table.date,
      _table.startTime,
      _table.endTime,
      _table.isLive,
      _table.owner,
      _table.location,
      _table.locationType,
      _table.title,
      _table.description,
      _table.nftMetadata
    );
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, MomentData memory _table) internal {
    set(
      _store,
      key,
      _table.date,
      _table.startTime,
      _table.endTime,
      _table.isLive,
      _table.owner,
      _table.location,
      _table.locationType,
      _table.title,
      _table.description,
      _table.nftMetadata
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (MomentData memory _table) {
    // 57 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 57));

    _table.date = (uint64(Bytes.slice8(_blob, 0)));

    _table.startTime = (uint64(Bytes.slice8(_blob, 8)));

    _table.endTime = (uint64(Bytes.slice8(_blob, 16)));

    _table.isLive = (_toBool(uint8(Bytes.slice1(_blob, 24))));

    _table.owner = (Bytes.slice32(_blob, 25));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 57) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 89;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.location = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.locationType = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(2);
      _table.title = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(3);
      _table.description = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(4);
      _table.nftMetadata = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    uint64 date,
    uint64 startTime,
    uint64 endTime,
    bool isLive,
    bytes32 owner,
    string memory location,
    string memory locationType,
    string memory title,
    string memory description,
    string memory nftMetadata
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](5);
    _counters[0] = uint40(bytes(location).length);
    _counters[1] = uint40(bytes(locationType).length);
    _counters[2] = uint40(bytes(title).length);
    _counters[3] = uint40(bytes(description).length);
    _counters[4] = uint40(bytes(nftMetadata).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return
      abi.encodePacked(
        date,
        startTime,
        endTime,
        isLive,
        owner,
        _encodedLengths.unwrap(),
        bytes((location)),
        bytes((locationType)),
        bytes((title)),
        bytes((description)),
        bytes((nftMetadata))
      );
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32((key));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}

function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}