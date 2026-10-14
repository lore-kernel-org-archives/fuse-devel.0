Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D644B68D
	for <fuse-devel@lists.linux.dev>; Wed, 14 Oct 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960196; cv=pass; b=GohNWPJU0GHJfjPdWq7FSDEBb70ClTNy5QiyUiqlcP6r2H3y6pADMsa6Hv0ydyzxKX69wlb/Xc57HOgafVB7G0s+3McOxfCfHRkAnpzFgLsUIMLMlW0k6XObwYwt/rod5coKxJkNtwKyHu38larGR0GMUfMNDYLqf4vQqi0P/WQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960196; c=relaxed/simple;
	bh=kF9c+8KKO+ipWwSE4hjYVCkfFFSKZ4K0zjQHaC5WzaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AUVrHB79Sg5ejZkOulnZWCpgGkfrxlhMQTBvd19zvcMrpSLyka7kEGcpJf5IBSO+g5gAcqLGz816l5dyMisSJNBszFYNWnVy3GgFjbmvuZ4gcDYjwRGC1nIaXZUYbZmsg4SDLs1yhj6sjC/W2zSCY+3rhgbbB8ZPjVvYTGR7ZJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIqQW+zg; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIqQW+zg"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a75f960be3so8506871fa.2
        for <fuse-devel@lists.linux.dev>; Tue, 13 Oct 2026 23:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791960192; cv=none;
        d=google.com; s=arc-20260327;
        b=Ogf1v4T16HEsGXvb049bB1rHzu/u9DI77yXC1vB8646LguJIDwRkrQrxkyq1/AGM/t
         pF3rjgp3TMj70eSaxQJjaL4Rxql1sFwEYw502Qj5/Rlb6ChmrmDeUgGcaAdqkviC67Xd
         Rb9C01UkCopB93QQ2iZ3eb6ZZhLL9cZf7iEa+Z/MyNBy22L3sWWwu54/bo7/pmBMKuee
         qY8pfMsE9bzD5aKZQZYktJp0lhD6Izox7YtIV+3rfylyUMOHgOEnel/m9YfN+Bs8bmC5
         ArcVOc1shaO1iaAd7jX7hCyBc/ryT236ZItjomYLEhXErzV+Vp5KVfdvAeMtH5Wz0O6Y
         B3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZwsjYHPheqBa+JzSbow2ZB78X+lBjsll/uWCTK8ljxY=;
        fh=l6koKpgM+cRgHpH/LDmdJpCKtB/RrYmdH7I3zQR3kQ0=;
        b=mAYOp80BmAeMBE28dM0mQ+vq20hYrZoS16297kjvtpKmRxqmpemxCTKh964gpl33Lm
         /gh+1tacRce/ezHNJcpk2aJpcozLLmQ/0/Zk1SGCBAL5DTMSuOEvA0VfZExqMLwyc/Da
         ZYCDHtYX/MfSz7Xbse9jdUEdcHIV21id7C5j0MW7VZnA9IjHipY1XZImpfY5HTqoBlqQ
         8eB4gNyiA7ZA/XM+64qgLMeHw8OsG5OF3PgbToPu0e6+lC68dwZk+3o8GCbX4Zc4eH4I
         PhBsgEgWgAfV9zCoW4PojptPN7xeuqqwluUrJqrxZ+5W2H4oQFg5Z00dFe5iRm4gxXHd
         CnYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960192; x=1792564992; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZwsjYHPheqBa+JzSbow2ZB78X+lBjsll/uWCTK8ljxY=;
        b=KIqQW+zgiavOxE74N14wX/IuzAbQ1p8peGUb0O3L3NSKcxh2Nk7Mn2xmYNtiPA2AiC
         bnMKyUpNsY+uX0hCq8sjX6Ed4jBgvSfTWfnINnXwQjGQdeTbBcU8TkzOqE3mzgwxZt8u
         QlT03cHpH3A/TUzxgrEJtxfmsAUU0zxPR62LB/V/D4aHgukBhcDZRUo9t8NXIQ3rCAQs
         4GEj6rm8ntqv77A9Qz05X3/7nVxVw0tkxIjoJ9qejdXgiTQi2o0Xgn/E705qO6kvg3rN
         AWtVQDCCAxoYm5O3B+E2QXayNLTC8lERwePtD4R6fqgOogt2HWUrYPlTwgkWbZ8Vz6Ge
         DDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960192; x=1792564992;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZwsjYHPheqBa+JzSbow2ZB78X+lBjsll/uWCTK8ljxY=;
        b=RzC/bCO57OE7CyZ3rqpdd8e3fJVYc1YlOVACJowsD+f0dWxzHirThywrZ5A5G/xhWi
         h4HxUhIPh++TzEXP6+T1bObRuTvHVCP1iY5TaduT+cbrdPwPeGBkEJ/Zt+s9aCCapAT9
         w4+Q4NsAaQCcrEoMMAEq8DHeg4t886UzaA6iSOL4psaqtAY6oiwKJwehn/1ea9pG8tGr
         AmkOEvy7RjWLaDCbB1ZVFdcJPVkFJiociDlZ0d05atOQU8mokdSng/onFURQmKI/qH53
         eBGt9i6BQgqqbIuaYFHeGAcbzoMxekpa1FvQ9rPHvWPPnZufQL3XKCRmAOYomvcRsSXV
         lgGA==
X-Gm-Message-State: AFq9FYIZTd5nz60b3keQdX36gA3GS44fNhAwYxYmYGsrwKTBUQEi7Ahs
	xarE8DaHJ+tVMStyHg5bifQB25u28jZoUSIgfZxLjY34/z1luU3LDECa+bYVDSZmQkAKWa2yIry
	3IlzJDwQv9tgtuBaDvcJ49fDifrDTZCY=
X-Gm-Gg: AYBFou2Mj+bH3MSKWgxPkRth+iIHK2NvC+/YXjWx1ipp89evRfGsAGJST/EVCTRJdxG
	zPMJ2AoC5p0zdJ74Y2MA/6UUIf4xEP/o/x95nXEA1GXewIYmPN/WEmV1VyUxuHxIBHshpHnQmIE
	lpHq+czvzh9lSGDmxnRpfjIxeUclSF8jGuxav/iCrbZp6oVw0B57dEZa5w+sFeJ+Uvur8RdVJAp
	NIlPwFMoX9J7pgL0NCTZMmTU6ti+gJgzJ+1Mlcq/3SyJjQux9q3rheMVk47LIFiwGm/PZ6Z4kR8
	leZ+9bAOsx2jhZs6lEpoRf5i0UP5PRy7YuAxm/lGNr//jNnOhFmdEwV4CaCG/HYUoTrZ04ypBg5
	oXReJM7bqeXTtdZIiWpWbZmYQGPiq3BWxmdSn3KlzTm3qHeBhb38EkJboJ1knUTmumthXrV8dUA
	==
X-Received: by 2002:a2e:b888:0:b0:3a9:82c2:ec1e with SMTP id
 38308e7fff4ca-3a9c537ed07mr33111191fa.15.1791960191931; Tue, 13 Oct 2026
 23:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929094812.93374-1-tkhandelwal32@gmail.com> <CAPwBhz_ow3BFEns2WL69Gj2BmOHGiFOEzP7U-=FfzSvoH=DZSA@mail.gmail.com>
In-Reply-To: <CAPwBhz_ow3BFEns2WL69Gj2BmOHGiFOEzP7U-=FfzSvoH=DZSA@mail.gmail.com>
From: Tarun Khandelwal <tkhandelwal32@gmail.com>
Date: Wed, 14 Oct 2026 12:12:34 +0530
X-Gm-Features: AclHuK_roABVrEaRhuHK5p8P-AhgVeh6e8Rm4bmNzCFIfTidAX3p_1c6lDNfvkM
Message-ID: <CAPwBhz-yAXeZTca0iFT=9fVhD8k7rUQBtjNKCw_FKPFzYFC2gw@mail.gmail.com>
Subject: Re: [PATCH] fuse: propagate SB_POSIXACL to submounts
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	virtualization@lists.linux.dev, German Maglione <gmaglione@redhat.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	linux-kernel@vger.kernel.org, Tarun Khandelwal <tarun@supabase.io>
Content-Type: text/plain; charset="UTF-8"

(Resending as plain text, the lists bounced the previous copy.)

Hi Miklos,

Gentle ping on this one.

It fixes POSIX ACLs being unusable (and not enforced) on virtiofs
submounts, so it may be a candidate for fixes. If leaving SB_POSIXACL
off submounts was intentional, I'm happy to rework or drop it.

Thanks,
Tarun

On Wed, 14 Oct 2026 at 11:22, Tarun Khandelwal <tkhandelwal32@gmail.com> wrote:
>
> Hi Miklos,
>
> Gentle ping on this one.
>
> It fixes POSIX ACLs being unusable (and not enforced) on virtiofs
> submounts, so it may be a candidate for fixes. If leaving SB_POSIXACL
> off submounts was intentional, I'm happy to rework or drop it.
>
> Thanks,
> Tarun
>
> On Tue, 29 Sept 2026 at 15:18, Tarun Khandelwal <tkhandelwal32@gmail.com> wrote:
>>
>> From: Tarun Khandelwal <tarun@supabase.io>
>>
>> fuse_fill_super_common() always sets SB_POSIXACL on the superblock, but
>> fuse_fill_super_submount() never does. Submount superblocks are created
>> from an fs_context with no sb_flags, so the superblock of an automounted
>> FUSE_ATTR_SUBMOUNT directory (e.g. a virtiofs export containing another
>> host mount) lacks SB_POSIXACL, even though it shares the fuse_conn, and
>> thus fc->posix_acl, with its parent.
>>
>> Since IS_POSIXACL() is false on such a submount, the VFS:
>>
>>  - fails setting POSIX ACLs with -EOPNOTSUPP and hides existing ACLs,
>>    without sending any request to the server;
>>  - applies the umask itself on create, so default ACLs on the server are
>>    not honoured for new files;
>>  - skips ACL checks in acl_permission_check(), so with
>>    default_permissions (implied by FUSE_POSIX_ACL) access is decided by
>>    the mode bits alone and restrictive ACL entries are not enforced.
>>
>> Copy SB_POSIXACL from the parent superblock, as is already done for the
>> other superblock fields inherited from it. It cannot be set in
>> fuse_sb_defaults(), because fuse_fill_super_common() checks whether the
>> flag was passed at mount time to decide fc->dont_mask before setting it.
>>
>> Reproducer, with virtiofsd 1.10.0 started with --posix-acl and an export
>> containing a nested mount:
>>
>>   host# mount -t tmpfs none /srv/share
>>   host# mkdir /srv/share/child
>>   host# mount -t tmpfs none /srv/share/child
>>   host# touch /srv/share/rootfile /srv/share/child/childfile
>>   guest# mount -t virtiofs <tag> /mnt
>>   guest# setfacl -m u:12345:rw /mnt/rootfile           # works
>>   guest# setfacl -m u:12345:rw /mnt/child/childfile
>>   setfacl: /mnt/child/childfile: Operation not supported
>>
>> With this patch the second setfacl succeeds, ACLs set on the host are
>> reported by getfacl on the submount, and default ACLs and ACL-based
>> access checks behave the same as on the root mount. Tested on v7.3-rc5
>> in a QEMU guest.
>>
>> Signed-off-by: Tarun Khandelwal <tarun@supabase.io>
>> ---
>> I wasn't sure whether leaving SB_POSIXACL off submount superblocks was
>> intentional. I would have opened an issue first, but since the fix is a
>> one-liner I'm sending the patch directly. If there is a reason for the
>> current behaviour, I'm happy to rework this or drop it.
>>
>>  fs/fuse/inode.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
>> index e9552be36..ef3c7fac4 100644
>> --- a/fs/fuse/inode.c
>> +++ b/fs/fuse/inode.c
>> @@ -1629,6 +1629,8 @@ static int fuse_fill_super_submount(struct super_block *sb,
>>         WARN_ON(sb->s_bdi != &noop_backing_dev_info);
>>         sb->s_bdi = bdi_get(parent_sb->s_bdi);
>>
>> +       sb->s_flags |= parent_sb->s_flags & SB_POSIXACL;
>> +
>>         sb->s_xattr = parent_sb->s_xattr;
>>         sb->s_export_op = parent_sb->s_export_op;
>>         sb->s_time_gran = parent_sb->s_time_gran;
>> --
>> 2.43.0
>>
