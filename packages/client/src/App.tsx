import React, { useEffect, useState } from 'react';
import './index.css';
import { useMUD } from './MUDContext';
import { useEntityQuery } from '@latticexyz/react';
import { Has } from '@latticexyz/recs';
import { magic } from './utils/magic';
import {
  Box,
  Button,
  Card,
  Container,
  LinearProgress,
  Skeleton,
  Typography,
} from '@mui/material';
import { ethers } from 'ethers';
import { Title } from '@mui/icons-material';
import { UserContext } from './utils/UserContext';
import HomeScreen from './Components/HomeScreen';

export const App = () => {
  const {
    components: { Moment, CheckIn },
  } = useMUD();

  const momentIds = useEntityQuery([Has(Moment)]);
  const [user, setUser] = useState(null as any);
  const [loading, setLoading] = useState(false);

  const handleLogout = async () => {
    if (!magic) return console.error('Magic not initialized');
    await magic.wallet.disconnect();
    setUser(null);
  };

  useEffect(() => {
    const checkUser = async () => {
      setLoading(true);
      if (!magic) return console.error('Magic not initialized');

      try {
        const walletInfo = await magic.wallet.getInfo();

        if (walletInfo) {
          setUser({
            ...user,
            wallet: walletInfo.publicAddress,
            web3Provider: walletInfo,
            logout: handleLogout,
          });
          // console.log('wallet info', walletInfo.publicAddress);
        } else {
          setLoading(false);
        }
        setLoading(false);
      } catch (error) {
        setLoading(false);
        console.error(error);
      }
    };
    checkUser();
  }, []);

  //handles magic login
  const handleLogin = async (e: any) => {
    e.preventDefault();

    const handleLogout = async () => {
      if (!magic) return console.error('Magic not initialized');
      await magic.wallet.disconnect();
      setUser(null);
    };

    // Log in using our email with Magic and store the returned DID token in a variable
    try {
      if (!magic) return console.error('Magic not initialized');
      const provider = await magic.wallet.getProvider();

      const web3Provider = new ethers.providers.Web3Provider(provider);

      const accounts = await magic.wallet.connectWithUI();
      console.log('here are the things', {
        ...user,
        accounts: accounts[0],
        web3Provider,
      });
      setUser({
        ...user,
        wallet: accounts[0],
        web3Provider,
        logout: handleLogout,
      });
    } catch (error) {
      console.error(error);
    }
  };

  if (user?.wallet) {
    console.log(user);
    return (
      <>
        <UserContext.Provider value={[user, setUser]}>
          <HomeScreen />
        </UserContext.Provider>
      </>
    );
  }

  if (loading) {
    return (
      <Container>
        <Box sx={{ width: '100%' }}>
          <LinearProgress />
        </Box>
      </Container>
    );
  }

  return (
    <Container>
      <Typography>Moments</Typography>
      <Typography> Make moments and prove you were there.</Typography>
      <Button variant="outlined" onClick={handleLogin}>
        Login
      </Button>
      <Card></Card>
    </Container>
  );
};
