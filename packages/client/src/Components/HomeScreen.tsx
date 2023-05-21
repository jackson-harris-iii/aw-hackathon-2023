import React, { useContext, useState } from 'react';
import { UserContext } from '../utils/UserContext';
import { useEntityQuery } from '@latticexyz/react';
import { Has } from '@latticexyz/recs';
import { useMUD } from '../MUDContext';
import {
  Box,
  AppBar,
  Toolbar,
  IconButton,
  Typography,
  Button,
  Modal,
  TextField,
  Switch,
  FormControlLabel,
} from '@mui/material';
import MenuIcon from '@mui/icons-material/Menu';
import AddCircleOutlineIcon from '@mui/icons-material/AddCircleOutline';
import LogoutIcon from '@mui/icons-material/Logout';
import RestoreIcon from '@mui/icons-material/Restore';
import CreateMoment from './createMoment';
const style = {
  position: 'absolute' as 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: 400,
  bgcolor: 'background.paper',
  border: '2px solid #000',
  boxShadow: 24,
  p: 4,
};

const HomeScreen = () => {
  const [user, setUser] = useContext(UserContext);
  const {
    components: { Moment, CheckIn },
    systemCalls: { createMoment, checkIn },
  } = useMUD();
  const momentIds = useEntityQuery([Has(Moment)]);

  // modal handlers
  const [isCreateMomentOpen, setIsCreateMomentOpen] = useState(false);
  const handleCreateMomentOpen = () => setIsCreateMomentOpen(true);
  const handleClose = () => setIsCreateMomentOpen(false);
  const isMomentLive = { inputProps: { 'aria-label': 'Is moment Live?' } };
  const [momentName, setMomentName] = useState('');
  const [momentLocation, setMomentLocation] = useState('');
  const [momentLocationType, setMomentLocationType] = useState('');
  const [momentDate, setMomentDate] = useState('');
  const [momentStartTime, setMomentStartTime] = useState('');
  const [momentEndTime, setMomentEndTime] = useState('');
  const [momentIsLive, setMomentIsLive] = useState(false);
  const [momentTitle, setMomentTitle] = useState('');
  const [momentDescription, setMomentDescription] = useState('');
  const [momentNftMetadata, setMomentNftMetadata] = useState('');

  // string memory location, string memory locationType, uint64 date, uint64 startTime, uint64 endTime, bool isLive, string memory title, string memory description, string memory nftMetadata

  const createMomentHandler = async () => {
    try {
      //TODO:  create NFT metadata with nft.storage

      createMoment({
        location: momentLocation,
        locationType: momentLocationType,
        date: momentDate,
        startTime: momentStartTime || 0,
        endTime: momentEndTime || 0,
        isLive: momentIsLive,
        title: momentTitle,
        description: momentDescription,
        nftMetadata: momentNftMetadata,
      });
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <Box sx={{ flexGrow: 1 }}>
        <AppBar position="static">
          <Toolbar>
            {/* <IconButton
              size="large"
              edge="start"
              color="inherit"
              aria-label="menu"
              sx={{ mr: 2 }}
            >
              <MenuIcon />
            </IconButton> */}
            <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
              Moments
            </Typography>
            <IconButton
              size="large"
              edge="end"
              color="inherit"
              aria-label="create moment"
              sx={{ mr: 2 }}
              onClick={handleCreateMomentOpen}
            >
              <AddCircleOutlineIcon color="inherit" />
            </IconButton>

            <IconButton
              size="large"
              edge="end"
              color="inherit"
              aria-label="history"
              sx={{ mr: 2 }}
              onClick={() => user.logout()}
            >
              <RestoreIcon color="inherit" />
            </IconButton>

            <IconButton
              size="large"
              edge="end"
              color="inherit"
              aria-label="logout"
              sx={{ mr: 2 }}
              onClick={() => user.logout()}
            >
              <LogoutIcon color="inherit" />
            </IconButton>
          </Toolbar>
        </AppBar>
      </Box>
      {/* Create Moment Modal */}
      <Modal
        open={isCreateMomentOpen}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <Typography id="modal-modal-title" variant="h6" component="h2">
            Create a Moment
          </Typography>
          <TextField
            id="momentTitle"
            label="momentTitle"
            type="momentTitle"
            fullWidth
            margin="normal"
          />
          <TextField
            id="outlined-basic"
            label="description"
            variant="outlined"
            fullWidth
            margin="normal"
          />
          <TextField
            id="outlined-basic"
            label="location"
            variant="outlined"
            fullWidth
            margin="normal"
          />
          <TextField
            id="outlined-basic"
            label="image url"
            variant="outlined"
            fullWidth
            margin="normal"
          />
          {/* <TextField
            id="date"
            // label="date"
            type="date"
            fullWidth
            margin="normal"
          /> */}
          {/* <TextField
            id="startTime"
            label="startTime"
            type="startTime"
            fullWidth
            margin="normal"
          />
          <TextField
            id="endTime"
            label="endTime"
            type="endTime"
            fullWidth
            margin="normal"
          /> */}
          <Box marginTop={2} marginBottom={2}>
            <FormControlLabel
              label="Is moment live?"
              control={<Switch {...isMomentLive} defaultChecked />}
            />
          </Box>
          <Button variant="contained" onClick={createMomentHandler} fullWidth>
            Create Moment
          </Button>
        </Box>
      </Modal>
    </>
  );
};
export default HomeScreen;
