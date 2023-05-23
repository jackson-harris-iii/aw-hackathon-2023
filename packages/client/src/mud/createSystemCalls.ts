import { ClientComponents } from './createClientComponents';
import { SetupNetworkResult } from './setupNetwork';
import { world } from './world';
import { MomentType } from '../utils/types';

export type SystemCalls = ReturnType<typeof createSystemCalls>;

const entityToBytes32 = (entity: string) => {
  return '0x' + entity.replace('0x', '').padStart(64, '0');
};

export function createSystemCalls(
  { worldSend }: SetupNetworkResult,
  components: ClientComponents
) {
  const createMoment = (moment: MomentType) => {
    const {
      date,
      startTime,
      endTime,
      isLive,
      owner,
      location,
      // locationType,
      title,
      description,
      nftMetadata,
    } = moment;
    return worldSend('createMoment', [
      date,
      startTime,
      endTime,
      isLive,
      owner,
      location,
      title,
      description,
      nftMetadata,
    ]);
  };

  const checkIn = (momentId: string, wallet: string) => {
    return worldSend('checkIn', [
      entityToBytes32(momentId),
      entityToBytes32(wallet),
    ] as any);
  };

  const toggleIsLive = (momentId: string) => {
    return worldSend('toggleIsLive', [entityToBytes32(momentId)] as any);
  };

  return { createMoment, checkIn, toggleIsLive };
}
