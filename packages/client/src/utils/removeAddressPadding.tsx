export const removeAddressPadding = (address: string) =>
  `0x${address.substring(26)}`;
