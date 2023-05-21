export type Moment = {
  location: string;
  locationType: string;
  date: number;
  startTime: number;
  endTime: number;
  isLive: boolean;
  owner: string;
  title: string;
  description: string;
  nftMetadata: string;
};

export type CheckIn = {
  momentId: string;
  blockNumber: number;
  wallet: string;
};
