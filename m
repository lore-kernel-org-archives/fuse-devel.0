Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175D4718DD
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143473; cv=pass; b=u5mswxOBu7WnpVcwEHJbJOG9FkYNxWSnVqKE38R7Sl6tPTs3vtrVugFPXbUNxhEhykRVTKRyWTeJASDNU+4zWxPzIB5bqmEeBqcYEuPFmquPM4BewGGcEoDxwsAS7xBLsQw1QdMpzWnbM0CKUYQaRpyQG06l+MF1QZbOmTJoUSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143473; c=relaxed/simple;
	bh=CCqz5HPpG93l7f8Cn42O1c4ODT9r8PrlcLsz5Puc844=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSoP7p2xb4QT8SSizIyrbBorvKkCDonCpMuRUj4RnxJmtsxYCdH9RQwAWq094nUPHW3sLNGubElN+e7hti0xJ/z2q3FMfWkQWgxnWnsvaS/JNj1gVij5/ccRWRw9+Ru9x7UlJ/C9wTTTL2Z8QVo/p0HKQU8P2tG/N1VVxWCPZF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Z3kNdvhj; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Z3kNdvhj"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15168a20b47so4176222c88.1
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 02:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792143470; cv=none;
        d=google.com; s=arc-20260327;
        b=pZDxKZRU56m2XAF0iV5fVxxjWv3v+NBE8Xak7A6mm+fXWjUiIVcYFE1gyGkhh2cMJ/
         rpfwM2R72ghYI8MscFVq3JBJf3AIpZEa9DkEDBzbCLoXKg3D8rN/de/NCl/aR9U6ogCN
         K1zt8W/t09oisGW+zAVslm4hLircJzSnjWR8oXwffh94qNaeBUse5KZc2PdjQL6tzZLo
         rXJR+qzjKDdacdCobFPKasbeD7t+Zv+tOUX6+I1MX1oviynyhrdyvMDYFvPWBhaM6y2w
         6aKNXeym2mtdbRL31JinDW6uoQgpuNeO3apmGtg/CpXkZVJFv/zwtJp80PJLcLAcxS1e
         XUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vCLaDxJTvic5a6eu6i8PyS2B0rw8U286RI8yG0wvAF8=;
        fh=R/yXhs04BL+4vQEseudmUOtPrT1Z4mHANuLNuzk2e/Y=;
        b=JNWf7NhyHFgz9D+J8Gp0gJZSfOAKor2MlhlPnrGJBEDUMtkn177nKsQGPyRAgmZGD5
         XQN7CrXXO+PMPSDwSzsTwAL83JAYib26rkwEIx2RcOJSLtcBuT6YYE7ryuERNfL6RhP3
         Fg41sNkgpW4ZbhZ+UwzMBumBjqVTCNvnab80rjxkKMQ5mJZW4AvJQ4ylNt1NoppBB/1m
         tVysxc1z1ipKZQRCFkkMSPQu05/Qywb6LZKDYmTZYf1KDJJXTB9qeGykwna+rzfL+1PR
         FsrdwCDBf1I3I8O/5nLqqyTX+7o53ly89sxahv/UPBXreF0KyecTgWxs6jotFWDpDyyQ
         36sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792143470; x=1792748270; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCLaDxJTvic5a6eu6i8PyS2B0rw8U286RI8yG0wvAF8=;
        b=Z3kNdvhjIluA3VVP6q3d27ZCgafU9fTjBVfvtEaYbCBKKcIDdbrDP/YbHr/EE2i06r
         8GTq5TgBF3Rhq5A3VFh0S+ek8YQkSGUk5Cu1Y55ZGT+VixN7pAWUdhGh45iY5dRoBlvW
         JL0bb8G6IC9EmmNW5AAfGxiln7EYstOdqGoeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143470; x=1792748270;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vCLaDxJTvic5a6eu6i8PyS2B0rw8U286RI8yG0wvAF8=;
        b=REeFY86gxZz52ruznyLAREsbEbe6G4k4tFBKH/BIzVooV6OGv2IHOcR4TLQGNBbmER
         IljjTbJpbPjq8Ts/CSlGysig2KRTKX9YN1ifLq7i9dai2TDEdqlV3juH0peiUMBBR5oZ
         nRiV7oFE0sFoBItlUBokoMYSrKTgaYKMlwOJ6y8QgeNnlw4TbwRp3gxKgNQyLdL1+iZY
         8uwTfLA9CUVkow92PEvXPwYlPj/Mo8WGyt1tRPf0WpUNT8E72lyAV2U8PKMm2fyqXH38
         MnDBgbWos4dDyAqkuGf6YIMdbEqXPNNdsh3HfyPEWQWbzKWTYzc4b78dTTtXtC3hVpXf
         ykQg==
X-Forwarded-Encrypted: i=1; AKwUvBwdnGNLoEYuDgmxUJVLG+8VVVDdnUzW+0FkCmJK95Pr8nmEcIM+FIhFOpfYH5vCj0lZ1MOjRAZE+2Fj@lists.linux.dev
X-Gm-Message-State: AFq9FYJx4FpJFgYULn04HZUnSqrE+RftJP9ynQS+M9p5ExhORTHZUfQa
	CaO0tqP1RrHmGi6kt+jVvGH2/VZpxQrtafyAb48Gn5Hq1Ojjeua44iGORgR9FTwCSy7M5VrUlRn
	bQAtAF3F4AZPtlUE/azBab2y6E2Rv1vG9XKdcK0aIdA==
X-Gm-Gg: AYBFou10V5cfNz+n03m/JgAIywx6HnTce94bJapIszLSFvniFAjFzJatCuooPMiGugz
	KePHr0uck4ifLIkF5QEIUYTkGWFpOQAz2TCNT0yCEWhuCwxmQta3N8SMZy0KTDsaTbz1bvrHwIw
	qvzah7KW5XJzIBWCVlu0SoL3/dMaovzVgnv6uy6MZ2pdxLphwruuaXQNMKh3W5OgFYX1lMuuZTh
	TX1gOcbyifKz5jKKWJ/parWnQ2mX9FVU5L/N5MlcghlZuc99rYNsV+iS45rv4kbNHxwEoWF+fnP
	wPf8V0XAeV7uXSRKisj+jNs7Qtvrty1AfELFQ+ToGJfUECVRFik5hwDXTv2GYAHOtqmuGNhg8XQ
	nBNLLJReY6QsI5qF83Q==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id
 a92af1059eb24-16a5eb5248bmr26677656c88.19.1792143469725; Fri, 16 Oct 2026
 02:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929032927.1451259-1-neilb@ownmail.net> <20260929032927.1451259-2-neilb@ownmail.net>
In-Reply-To: <20260929032927.1451259-2-neilb@ownmail.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:37:36 +0200
X-Gm-Features: AclHuK90baevLdZyUbmceJ73OjlsJVPDiUN_j3whqpwfuH99OUIsIo6LPDruDMI
Message-ID: <CAJfpegsUg7E62ixTrb1UJ+mFW4sKLV3pNmL7ouWSJBC_W6bFkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: don't d_drop() before d_splice_alias()
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 05:29, NeilBrown <neilb@ownmail.net> wrote:

> d_splice_alias() now works on hashed dentries so the d_drop() isn't
> needed.  Drop it.

Applied, thanks.

Miklos
