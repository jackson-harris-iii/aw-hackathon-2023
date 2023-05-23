export type MomentType = {
  date: number | bigint;
  startTime: number | bigint;
  endTime: number | bigint;
  isLive: boolean;
  owner: string;
  location: string;
  // locationType: string;
  title: string;
  description: string;
  nftMetadata: string;
};

export type CheckIn = {
  momentId: string;
  blockNumber: number | bigint;
  wallet: string;
};
