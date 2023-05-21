// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { addressToEntity } from "../Utils.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

import { 
  Moment,
  MomentData,
  CheckIn,
  CheckInData
} from "../codegen/Tables.sol";

contract CheckInSystem is System {
  function checkIn(bytes32 momentId) public {
    
    bytes32 id = getUniqueEntity();

    CheckIn.set(id, CheckInData({
      momentId: momentId,
      blockNumber: block.number,
      wallet: addressToEntity(_msgSender())
    }));
  }
}
