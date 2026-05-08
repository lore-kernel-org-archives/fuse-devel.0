Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EA34F25C
	for <fuse-devel@lists.linux.dev>; Fri,  8 May 2026 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245293; cv=pass; b=Atf8sOG99Tn5ifdnWMQxOiSqYfHwOIU8n8T+SSdQ3LbiqBOvoNXKRAmBXj2qBFEcZEX565Gr2W0eJ+jccb+fjPn59b5eazkg3N9Njs9M2TLo8aqu2J3MbPBEfrQe/CMv4lt7kyuDWh7ZqbB5G3qHcIqQGmqkJHtCUIiAlFL2Uak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245293; c=relaxed/simple;
	bh=UEqXicTfnM6HdHxwrNeRDh2kHHPbf0wyeUC9LcwMo5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o89CiD6HWSmrbFvG+NdC7dTppmgIpJ6RlidSqir6GF0FKRfKmVrpYEWw0hVpXwgINY4AtRd0D8b34bCb/zBwsvHEKhcLkaIN9XGta16ywy4aomSRmFFReUyj727xhn6KF81/mp/auHgkhkhQyRx9hX704sTMZwmQFDDfF4Za1GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbXSO3uy; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbXSO3uy"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso3640138a12.3
        for <fuse-devel@lists.linux.dev>; Fri, 08 May 2026 06:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778245290; cv=none;
        d=google.com; s=arc-20240605;
        b=XDUIgH+zzRM4Nd7sexhksbHetENPPmAtCbBvOzk6urcllXdGWgeAtybcJQKZhDbQTX
         tHQKrqrWs9oF4aPoQgP9ns5iRSYziB54IaL48JxYs1fzQexb5XzQYGV4DSiC4MbXBdBt
         jaNtKHd2iC+uhsaNaPVuT92TG6dNkq2+jbkLutBVgN/vQNxtR3PcIQM/J+UEQywVeRTw
         n76vJmNe2UWTTxN7ETzmIqnaGhH/TRq1qizMPr7/pDeMGO3XgFI23p4c6/px3R4Z+sS3
         L4IpgT7Hq7L5Fckpt8tIIS6YIIa6Wi2nC9PFAGHbcX0hHVjcpJww5HQ/IaTVBC+S8mZv
         0hCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eheK66B8cRyIDoMQkUeVVcUOm8ou8dWbCp5qpckbR9A=;
        fh=AYQJtCg19bBaiJgrxF96p5+N3nPEnhDWAy5p0ZGqEI4=;
        b=FJHkygaA7mCcvnB4MHdDuJ9qtvHcl8gesQZFuPnxlZZfFRYuHnvspnQOhAHRAUcsRj
         U0aSjfA9zgUrmeMrGErUUOPZq4+qvjNXQwl9uBbE/Mkw5z7PdIwfSK4RvAWjj+sF0tLM
         cJanxRMgc/SV/kWgf/98gR7uDBIf30gXarPW2LpRPr7mA3mlvtR0XJQOYpHf4kq+Q5wC
         SGGZEy9ZVe/Vgl7MMeAnQWvDYwP9kBw0WexsTa7qZJ2HTW51NqAjGrNnPPMCGgmUdcPU
         QhkJsL/ZzZkPC0Crnrm87EYC7Jaw56YYe3YAjCHFJT23vefKkkhXXd8s0FXr4fqKEzUu
         Knug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245290; x=1778850090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eheK66B8cRyIDoMQkUeVVcUOm8ou8dWbCp5qpckbR9A=;
        b=HbXSO3uyV5HghefWzLaayTargFvgk9S7pJxJuhnbMgNvklL7L5IWCc0YrC6F4ZXFKm
         JHpVdWG+og5Vf0TuMS2M3xTFYlbMgrcZg42FTcQs1lkKKqjXM+39nUCtPM2l8LRliGEv
         s9SlpLveN1Io+0SWdf0gSMzHmjfihcxIJoB1edFgrRgKJiTQ70eRnHQXDsRm5xWlYlys
         2h4xOy4sIZpuKIk4OJcJamLHKwC8CJNJuCV0HbMl+eAZGBSDsH330dMjrqIvb6LuE5zu
         X33pkxXuiG7UJMi6rVRxXNOWs8Hx7J1ATgUQ3J6e0z/U07zIrOqI18Xd1s7+/ao+g1Lt
         NglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245290; x=1778850090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eheK66B8cRyIDoMQkUeVVcUOm8ou8dWbCp5qpckbR9A=;
        b=BCsfrwviFrTLCsdR6tBUEwdZFTL9Qx3qZd8R7gMNbELPrfgV20XHCndjp6iNFp2elu
         PD1vfMqkc+i3srWrZBrAgzBn3XYmkJKNlpa03er1t0IRNg7U4TcIKNbUp7KxryAqGW1q
         LXIJ6l45YvHAWAegSGcYa5Mtx3StcEaTAD6QWlNIsbTrkKCC6IFKnDOEGFE14sNVWm1H
         wQhV+AfIHVdYVI397QBrDcbxx2TJ96rqXT8rSE48JbvGGR0YoPkN7t94UHUzc/PVFIAw
         Oabh4by8tyQOxFPQp9m63sFzKQQhK4BnvO5w8PLxGxvzwI9VSUrilisD3aS4mD+GU4F9
         O32g==
X-Gm-Message-State: AOJu0YwRF7ArHLKBTxV+4YZi8d+2NLhri9kvJWlT45yjDGIwvzDXbere
	euqERmgNCUqHqTwypyMp5ItHk3uESVFw2pSgdBt6vBg5GcxoiXMIM/3cq6A/SWcY0YAoTHsdwNE
	GeCPhh5iyuFyQEtpJB/SdYZJxd7lZ1bI=
X-Gm-Gg: Acq92OF0uFeS6+7J91uWif+exKLiNE+lTVv7I6QksHBumh0gf7x+slE6p3po6rPeBv2
	Gd+eFI9EDjMYoZlIMIZmRDzaGCu7mrh17uGLni949ezMw7GJ6b0nlYFfA/T1z/6JwIeeHtHJlhV
	T2OLNYxjyv3+uxo1XIYr2JxgLoHND2X/Lw0Q54cKbLL7nv4ymwAImSlyKcHP4cCrzXk3mrLgZAv
	72cNxTn5qvkHWsswlZe58zRVESalfeoMN9jq3Tc7vjKpuW8ilhrcCRpQ+/9xOVNHPE0/0I+5iJA
	pAxx2donthwWbK/SwV7kJ3vMQyckeW6fxj+TM/VEuw==
X-Received: by 2002:a05:6402:4348:b0:676:9caa:f070 with SMTP id
 4fb4d7f45d1cf-67d642b23f0mr6835419a12.14.1778245289801; Fri, 08 May 2026
 06:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <afxK2HSiwY32KaWw@fedora>
In-Reply-To: <afxK2HSiwY32KaWw@fedora>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 8 May 2026 15:01:16 +0200
X-Gm-Features: AVHnY4IXxta-2ngFEGkxy0LC7oZseIvF0NghuKtJ8IJRDq2LCu03iYMcxCxKPsg
Message-ID: <CAOQ4uxg-tgCmJkjFAQ86_xB7dDQKGy=geKAcxT2vB8cUSEKdPQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Horst Birthelmer <horst@birthelmer.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:49=E2=80=AFAM Horst Birthelmer <horst@birthelmer.=
de> wrote:
>
> On Wed, Apr 29, 2026 at 12:20:57PM +0200, Miklos Szeredi wrote:
> > This stands for "fuse extended/experimental".
> >
> > The purpose is to provide a clean base for big features like the FUSE_I=
OMAP
> > api.
> >
> > It's also a good way to try new stuff like file handles and compound
> > requests without the risk of breaking something in the large and comple=
x
> > fuse codebase.
> >
> > Whether these features will be migrated back into the main fuse codebas=
e,
> > or fusex is going to end up as a major version update is still up in th=
e
> > air.
> >
> > Major differences from regular fuse:
> >
> >  - local filesystem mode only

What about things like?
FUSE_HANDLE_KILLPRIV | FUSE_HANDLE_KILLPRIV_V2
FUSE_ATOMIC_O_TRUNC

Does local-only mean that all those (and default_permissions)
are handled by the kernel?

> >  - only synchronous FUSE_INIT is supported
> >  - only no-open mode
> >  - new requests:
> >    + FUSE_LOOKUP_ROOT - return nodeid of root
> >    + FUSE_LOOKUPX - FUSE_LOOKUP without the getattr
> >    + FUSE_MKOBJX - merged FUSE_MKNOD, MKDIR, SYMLINK and TMPFILE
> >    + FUSE_SETSTATX - extended version of FUSE_SETATTR
> >
> > Missing features:
> >
> >  - file handles / export ops

Need to sort out this API that grew odd organically over the years:

FUSE_EXPORT_SUPPORT | FUSE_NO_EXPORT_SUPPORT

The problem is that libfuse declares FUSE_EXPORT_SUPPORT
on behalf of high level filesystems which do not really provide thse
persistent NFS file handle guarantees.

I see no reason for fusex to not support lookup by ".", which is
anyway needed for "reconnect", so a fresh FUSEX_NFS_EXPORT opt-in
for "re-export to NFS" may make more sense.

Thanks,
Amir.
