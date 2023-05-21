import { ClientComponents } from './createClientComponents';
import { SetupNetworkResult } from './setupNetwork';
import { world } from './world';
import { Moment } from '../utils/types';

export type SystemCalls = ReturnType<typeof createSystemCalls>;

const entityToBytes32 = (entity: string) => {
  return '0x' + entity.replace('0x', '').padStart(64, '0');
};

export function createSystemCalls(
  { worldSend }: SetupNetworkResult,
  components: ClientComponents
) {
  const createMoment = (moment: any) => {
    worldSend('createMoment', [...moment] as any);
  };

  const checkIn = (momentId: string) => {
    worldSend('checkIn', [entityToBytes32(momentId)] as any);
  };

  return { createMoment, checkIn };
}
