Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C1326B2DA
	for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784721636; cv=pass; b=OR6AGPNN49eM5Ti6VMi24bAigql9o9HSNmfH5thrnO56iEYsnWCY7RgxRVRaZt63SZWtR+EIW8dMcivStAkD2/XO+GxvwIA7sGrJ0euZqE73fnRW1mtq3CrlQoDAJd9+mmGDKSwZhyuog3YDYvdqvtNq0qQw841aNmyQfNSs7zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784721636; c=relaxed/simple;
	bh=kFMs52AOJF+ZO+QHMwPUw6nenC9AxCG38+qxSIB1z0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMwKRLK0ZVs0rlEXKPuSTy9fpuLoxoUKEE9JwpOnadISGn/GBUHh/k1VJFGZzfyjgNykgewcgCMsbgJEleMKOYwAu5YMX6rq1cdnLtlsLTM62iGDr6BkJTt5vq1yMA68fiB2d585LZi22I6MODjZmz2/lHkYQvi/e49XZp1qhRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ZV/3aF9i; arc=pass smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ZV/3aF9i"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5c9211d2so1114130485a.1
        for <fuse-devel@lists.linux.dev>; Wed, 22 Jul 2026 05:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784721633; cv=none;
        d=google.com; s=arc-20260327;
        b=jLH+FEN/5fTbn15HFz1pK/PAXWxRIdNAi8/8GHQouH6xNM8ONrVMntb0bShohhA7vG
         VYaK0An65TcAobAKJ1cXANfOAFaPUllr8HrFBSPhkiK2/Dmzl3RSDLcLlrcCPzSiyZWa
         RN9RPd9c+9s9tJOgCrGVVDh3H16ya52EV23foSOXr2ovpyjxCm47onKxZtFwwJjj56SA
         HmdZFjcG5vVWwFF7wlF7tQGQ73CcdArXty/G/2umarfHwQWAWh9ncLbvLg9ap58ABW0V
         7qhof0oTZk6O62WhdSZpyIxGN3mw6eXFa5wjMIbmcuuAoDtiXYSftuLiEpsE+wTsZHNO
         AsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vLNGN2sFhQthc30m4BZvuYPjXCE6kmT3n6FWRwD4xQw=;
        fh=SJ21pFQfN+GhJ5sUxdhi4r8hwa/+PTqkoIV3Hdl7LFw=;
        b=RKX+BVXIIOsIZJss8phxWuhrLki5a5fIPFypN5872v9wR5gqJEJJh7/dYGRbsjjLxk
         Rxq81JLFjRp1z50NTmWgNFzGM/a0Z45MvaC07GCP6+OtUmdIAiKtAgQ6AvRtpwVrrU42
         FtQDwaLyLZUzt1lDbFitZ/nc0YMjuTVjL0n7ZjWZQP5rHRB95vAaMZP2OFNATX2kGrLo
         gWdaoZEFkZf+FQyXnZAHpUorqWkJWLXaecW2pS06KsdXFFadA6kxbaw7aQefS6K4a9MA
         GrPARJv/vxXjXAJARxIVwe8kIRQQaN4QVkDMX7Zn0n+lLUpVEj2y0knqTldPs3vuSQaX
         dmxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784721633; x=1785326433; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLNGN2sFhQthc30m4BZvuYPjXCE6kmT3n6FWRwD4xQw=;
        b=ZV/3aF9iAiQtjr5jTjJ2L1Pn7GnHVX13AVUIKfr1fCc+bRtuBGJPVKo1t9hLVcOj2C
         86ANrUPEOJEC/RbHc0qmvO5M+T1T7lV+8lmQH0deScXo/63YykEDvt26ra7KsG97P6s9
         hXY4ot08VibX1pJlea6HMW74VMqhhQbCKhWQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784721633; x=1785326433;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vLNGN2sFhQthc30m4BZvuYPjXCE6kmT3n6FWRwD4xQw=;
        b=EpAWWUdrRjPG2kzeUkRQx6LMZvzrO4FgP8vtfoVSZ1034qlQ6TwBB0ueAsWGLjan/5
         5SfTm8pLyIEfWtCEzFSTsiO5v+osiAhNh7A/XuUc3tt6Rq/C6EpyVPKeK4PxxRf5r/9O
         gjoNUSrHWmfsQ8C/mP/uS1MUdFJbyJsCI+moEe2/R6Dhfke42cm1CypPG853zCn0X1BD
         JkrZYGP5RuFdMkewg0TNO3UQgi9ht1PJzAO73pf+E1mCjImaP253gp0TC3QX8FI7E6aQ
         0DRheVX/Q7olOSYdBC8ro/negSdduWyVC7l6uOOCP+r76hE/6aWIQV6Jk9jHr1EXL++6
         7Jvg==
X-Forwarded-Encrypted: i=1; AHgh+Rrgql+kQWxiQZjWwvDbkbjGDNymOoZ3NE+ROVV0pHPGxzE3CC2qgslVC1Gr9b23sDKW5uxaDLG+Ajj5@lists.linux.dev
X-Gm-Message-State: AOJu0Yyltonj/vzp0Cq0WkkMEpoyOGT4OkytNXgahgf8oJ98WgK35A2v
	ifDmeLuAkaml7DdgQf+/A/FYBsE90Z/ThK8592wDF3Hej+raK+HneUBvg12T0CSOJ4cbJTffpBC
	vnqJ9TopmFc7TSVk//F0V5T9tQX3ImxlUBEg40TbV5g==
X-Gm-Gg: AR+sD12TuAgAKVguPVU8I2t0QNbIGy3Orj0wrogWCmrzRnLGHqUuH0zbtCm0rz4pTPx
	i8AzLHn5fagTZ5yaH0h1Ozi2kZUaiKm8KS1J0ZqoxnpRsfGCuDgJWea3jTOEG0tept3fEJpyPoV
	qVAwng8I/tc6SGdO91ibsKNpkvraV13IntOcTO2xTdaAZ6Bke9pRboAQaQSHiJf2uvcJ03yrgLQ
	SpzLS8L1FOXp9Wp75ioj355bxu8gyQUk3/t6SdmhjZkjnnVaF2KJpasdTGVjnp8UMjHRdtASP6O
	fvHPRHh6s5o85tkQ9A==
X-Received: by 2002:a05:620a:701b:b0:92e:c118:18b3 with SMTP id
 af79cd13be357-930b43b7cfamr2357527585a.82.1784721632987; Wed, 22 Jul 2026
 05:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-2-joannelkoong@gmail.com> <CAJfpegsNb=1P7Vh+DVfg3Ve9T8ggHxi1Y-ZhqiQ6R1bbnCTHGA@mail.gmail.com>
 <CAJnrk1Y8mwyeqqL=CaW-=Qn+kRghZNbJqSMqCSW_8DDCVyKKgg@mail.gmail.com>
 <CAJfpegucmqTZan0rLL8YoKy6h8UCzKuZQAsvasFpHgy64Nh4JA@mail.gmail.com>
 <CAJnrk1YMO2FgReO0Uc8Axx+D2C3WWGgU2YF6R0XSk72AvULXEw@mail.gmail.com> <CAJnrk1ZUUk=Emu1AfGtZ+GBHd7pH_9h1u-0kUstPVJ2cT38N2w@mail.gmail.com>
In-Reply-To: <CAJnrk1ZUUk=Emu1AfGtZ+GBHd7pH_9h1u-0kUstPVJ2cT38N2w@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 22 Jul 2026 14:00:20 +0200
X-Gm-Features: AUfX_mwJaZ5QoOM2GAjp_4QVBxrm8AyIzLCqZeogZRRjbYlIFj4E4pTDvaIGKiI
Message-ID: <CAJfpegsAQfAp85ZBCX-picMnqAvBQCNWTVVO-Vaz94nj6HkWFg@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] fuse: decouple fuse_ring creation from ent registration
To: Joanne Koong <joannelkoong@gmail.com>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk, 
	bernd@bsbernd.com, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 at 01:10, Joanne Koong <joannelkoong@gmail.com> wrote:

> We can fix up libfuse [1] to no longer send REGISTER before the
> connection is initialized, so I don't think a kernel fix is strictly
> needed here, but if you still prefer kernel code to coordinate this, I
> can send that out.

With async INIT this is possible by waiting until the write(2) syscall
for the INIT reply returns.  This is because the initialization is
performed within the context of the write call.

For sync INIT the initialization is performed in the context of the
mount/FSCONFIG_CMD_CREATE, libfuse can wait until the respective
syscall returns.

So yes, it's possible to ensure this from userspace, no kernel change is need.

Thanks,
Miklos
