import {DestinyMembershipInfo, UserInfoCard} from '../types/UserInfoCard.type';

export const parseDisplayName = (displayName: string): [string, string] => {
    const parsedName = displayName.split('#')
    return [parsedName[0], parsedName[1]]
}

export const SerializeUserInfo = (data: any): UserInfoCard => {
    let membershipInfoArray: Array<DestinyMembershipInfo> = [];

    for (const membership of data.destinyMemberships) {
        const newMembership: DestinyMembershipInfo = {
            iconPath: membership.iconPath,
            crossSaveOverride: membership.crossSaveOverride,
            applicableMembershipTypes: membership.applicableMembershipTypes.map((item: number) => item),
            isPublic: membership.isPublic,
            membershipType: membership.membershipType,
            membershipId: membership.membershipId,
            displayName: membership.displayName,
        } as DestinyMembershipInfo;
        membershipInfoArray = [...membershipInfoArray, newMembership];
    }

    const mainMembershipInfo = membershipInfoArray.find((membershipInfo) => {
        return membershipInfo.membershipType === membershipInfo.crossSaveOverride
    });
    let globalMembershipId: string = '';
    if (mainMembershipInfo)
        globalMembershipId = mainMembershipInfo.membershipId;
    return <UserInfoCard>{
        bungieGlobalDisplayName: data.bungieGlobalDisplayName,
        bungieGlobalDisplayNameCode: data.bungieGlobalDisplayNameCode.toString().padStart(4, '0'),
        bungieNetMembershipId: data.bungieNetMembershipId,
        bungieMembershipId: globalMembershipId,
        destinyMembership: mainMembershipInfo
    };
}