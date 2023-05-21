import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Moment: {
      schema: {
        date: "uint64",
        startTime: "uint64",
        endTime: "uint64",
        isLive: "bool",
        owner: "bytes32",
        location: "string",
        locationType: "string",
        title: "string",
        description: "string",
        nftMetadata: "string",
      },
    },
    CheckIn: {
      schema: {
        momentId: "bytes32",
        blockNumber: "uint256",
        wallet: "bytes32",
      },
    },
  },
  modules: [
    {
      name: "UniqueEntityModule",
      root: true,
      args: [],
    },
  ],
});
