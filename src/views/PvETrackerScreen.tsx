import React, {useEffect, useState} from 'react';

import {Input, View, VStack} from 'native-base';
import {ImageBackground} from 'react-native';

import CenteredAlert from '../components/CenteredAlert';
import {fetchPvEStatsForUser, fetchUsers} from '../utils/BungieAPI';

import {SerializeUserInfo} from '../utils/utils';
import {UserInfoCard} from '../types/UserInfoCard.type';

export default function PvETrackerScreen() {
    const [userList, setUserList] = useState<Array<UserInfoCard>>([]);
    const [isError, setError] = useState<boolean>(false);
    const [bungieId, setBungieId] = useState<string>('');

    const [_, setInputFocus] = useState<boolean>(false);

    const [selectedProfile, setSelectedProfile] = useState<string>('');

    useEffect(() => {
        let usersList: Array<UserInfoCard> = [];

        fetchUsers(bungieId).then((data) => {
            if (data.Response.searchResults === undefined)
                setError(true);
            for (const userInfo of data.Response.searchResults)
                usersList = [...usersList, SerializeUserInfo(userInfo)];
            setUserList(usersList);
        });
    }, [bungieId]);

    useEffect(() => {
        const mostValuableUser: UserInfoCard = userList[0];
        let pveStats: string;

        if (selectedProfile === '' || mostValuableUser === undefined)
            return;
        fetchPvEStatsForUser(
            mostValuableUser.destinyMembership.membershipType,
            mostValuableUser.bungieMembershipId,
        ).then((data) => {
            if (data.Response === undefined)
                setError(true);
            console.log(data.Response.mergedAllCharacters.results.allPvE);
        })
    }, [selectedProfile]);

    return <>
        <ImageBackground source={require('../../assets/D2Background.jpg')} style={{ width: '100%', height: '100%' }}>
            <View flex='1' alignItems='center'>
                <VStack safeAreaTop w='90%' alignItems='center'>
                    <Input
                        variant='underlined'
                        w='85%'
                        size='md'
                        value={bungieId}
                        onFocus={() => setInputFocus(true)}
                        onBlur={() => setInputFocus(false)}
                        style={{ color: '#ffffff' }}
                        placeholder='Guardian Display Name'
                        onChangeText={(guardianDisplayName: string) => {
                            setSelectedProfile('');
                            setBungieId(guardianDisplayName);
                        }}
                        onSubmitEditing={(event) => setSelectedProfile(event.nativeEvent.text)}
                    />
                </VStack>
            </View>
            {isError ?
                <CenteredAlert
                    status='error'
                    title='Error when fetching users!'
                    description='An error occurred when trying to fetch users using Bungie API.'
                    onClose={() => setError(false)}
                /> : null
            }
        </ImageBackground>
    </>
}