Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072C614A60F
	for <fuse-devel@lists.linux.dev>; Mon,  1 Jun 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303339; cv=pass; b=Yyz2B8ldApCaRtwADdceyqUKXM9VarsA6WpKU6Jy6bIKbKQL64/9X9AWj/CMISEefIGbUF8+nGLPeBS4xXMOZGYeiZceTtwkSb/e9hmpM4WCThVRgIel0kzR1mK7EbbEjkexM2EVelQXR4I5WmOWEoMyPUOQKpnFMwrNaBA9F40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303339; c=relaxed/simple;
	bh=UTbkwMsrfw5DD1bwnCMaOoHJmgEVR8v1IDZFFZ9xH+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSh/gpfpPsAfBptn0wsPmbOZf9qz8Q/RAKB3nYlRUUH2M0+hCGbakKGQiEJSMx9DuIznkb4vTzChuvAR+byCocIeurrsULNMwmLzqfYhrpgutK7A+UkFzgR11tXbYt5P9E9gy+PLgSLnEOD6TkbueigqABfUVD8QlWl+yiBR4NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=lW4MZhJA; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="lW4MZhJA"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516d15ed2bcso92634961cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 01 Jun 2026 01:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780303337; cv=none;
        d=google.com; s=arc-20240605;
        b=XNx1bbGxYju9y3v2ML0LVNz+ScrUnPL09s3JVZMS0BHgiWsq4MXB5p5VrXJENrdLoo
         5XUKxJmdbXNmQbhBhADSkxQeO0LO65AVL/jnybkHlIFJDUf0bD1CZNk3XVChyVqz16E0
         DrnJExAAS9OH/sPwMM22k6V0SuslEOP734STSqlYBl69McJGhUVrOXXu0KnEpprjlMQE
         jRAf511hFXDMswLRrgGWubnk7PBgvwEI98Lgfig2dQWJ9Cm8wJEno7VVkwddqWZ3tSIE
         KIQIgXPCYsoquLGpZoMck2q1FNY31fMiFBikHbHdp5SgJ/woeW8QBsLJA7oSMWuZhTF0
         JTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fLytNvYVztilDxrcrU7bSLGgh4QOhycsAm+cSCqJtbw=;
        fh=+EAarq3+OS2kYlZXN2hXDO2ntnvT/2269CgYShktUu8=;
        b=a6Qmam7oJ7KwkQ5XQ+OXKuBoFTbQPepw8Af9HC2Vbe7//XK20I9Gg8pD7RMSho+PNK
         0rjeNtH6i+ak2lJYs3p/i/91p/bxkdCmjXbjpbIlgUYT+Tld5FGR8wbYIZiKajLV/SsX
         NsE1fCRyCY3pqqWBKMRj2cCoJ2a774c/4dAcmKN9VRwvQ4dfNgPfoUl2MStyccfiK6FU
         nTO2iabTz/sZYi2DE6tdl/q7SD3eijWmvn1h0rZL28cawc1Wg2sRwq75KFqfEv2dcvA+
         dOz/cBudkoMnyWMgR18wfBPedHmtGhwjD/7Cy7OPn39r0esPDIxs3jXOQjcs1cPtuIIE
         5h5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780303337; x=1780908137; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fLytNvYVztilDxrcrU7bSLGgh4QOhycsAm+cSCqJtbw=;
        b=lW4MZhJA/HFPj+8k+Gxf7AKH3dJu1o7fIJ8Unw285qY231pzo3gAyVVgaUphpd9oqE
         5OA1eFC8bryxR91UivG4Ojzt9wi4TX5F3VykcpCU5UXvwaf6kRnQfnfib6dGXfYhQEat
         fc8eTzyvte1WfwV8RvpFEqYa0ntYS3Vg1TQqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303337; x=1780908137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLytNvYVztilDxrcrU7bSLGgh4QOhycsAm+cSCqJtbw=;
        b=JghD93cyracvgBt5oKlieANWlc1JW/xaSQYsAtdXN+ptg3fjfIbBaSMZtJgQr+uw1z
         APNoqKB9FVImAZNdp/DAe1RKNoN81cYTIpRC3Kig4G7T1ndAVBBMNdO72h5GdpsuQJ2V
         Rl0ZUJksv1TwQ9rbMPa1Sj6XVRgozlRDUIfvZVwce4tAcHWrkqDql2Trsftz01+a/HGC
         k/dP/9H3UuHq44I3Qxd1Q/pHZ3DlWRkIVkshRqq1pv+AGNYERfZWADNjvx1MCFxsOEJc
         tJFdvHaytpKFRMko4GQ4j+tl/CbxA9fLO67R+Mvh3+Rr4aa5DTgj15GWlF55t+rOwvrN
         8rAw==
X-Forwarded-Encrypted: i=1; AFNElJ/ROfHP3HqonXq1zm6bJl0B53kM/9wKee5uXfxmZsCsse9K6VGEAF+/VzeGLDoNNyZmLtJb48EA0SFD@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5As9RzZV4+SALuevfdcg791nDgLDsjGZ+LoZ84jiA7NrOEBbJ
	3MYhd158B9XYlKbh+jqTjs54olyJOskM9R6FCrcHcbbIkLzt5nAy1hFSHbj4fauogYlntfZn2sN
	V23HCxBaZkiCQiy6If1Dix4FJ2xiYlK1RBxc+F0w7kw==
X-Gm-Gg: Acq92OH8VzhIWOHc/crYhDRKe9HNUkPhzACXK2BzDRd/TSb4k0BxxU+0m2vGIOChK1d
	CPwR6Ppbln0BFTJ1xn1REjrT0sJSh2l5NV4cfgEd5gWdL2NY9ba6NVpyjOlgFP2CNA7FM0zdiTX
	ugBb+m0hZQ7o4mAC/nYF8TBbBsLrxTo1sx7AyZCI3MG5oRr2Kf6/PoJKJwU5ijk7WxFP3+jr+DY
	VK43jEz9Obk4JghK6OGUYhtIuh6aI252XhHVsNPrZzs9CfI6LywHBnH9/O7j/JI9i+JiMVnUwRj
	a+vg05J1/l/GP5LpE6Ed5JHngJj/pk2HDbdqBJN+r939GsGhdg==
X-Received: by 2002:ac8:58c8:0:b0:50b:3429:a10b with SMTP id
 d75a77b69052e-5173a72badamr116737761cf.12.1780303337147; Mon, 01 Jun 2026
 01:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529134302.1989958-1-mszeredi@redhat.com> <CAOQ4uxjZ66rSmbsDMRbrohC4LE4RgLzKotH6N_TYz92bZ-nR8Q@mail.gmail.com>
In-Reply-To: <CAOQ4uxjZ66rSmbsDMRbrohC4LE4RgLzKotH6N_TYz92bZ-nR8Q@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 1 Jun 2026 10:42:06 +0200
X-Gm-Features: AVHnY4LsP-cd8mjcfQ-DpqLYZy-SDFfzupmW4YT8BHxYon500RdtNkfy48x3EaM
Message-ID: <CAJfpegt6x_CNqdy65xKQgRfAg=RiNPbCiESYAUWnH1X_=W3MXA@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_GET_DAXDEV -> FUSE_DEV_IOC_BACKING_OPEN
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <john@groves.net>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 May 2026 at 19:36, Amir Goldstein <amir73il@gmail.com> wrote:

> Could possibly use fuse_backing_ops that Darrick used for iomap
> backing devices to generalize the backing id ioctls:
>
> https://lore.kernel.org/fuse-devel/177922945327.2436837.2738315299316875094.stgit@frogsfrogsfrogs/

Yeah, this is very much just the userspace API fix.  Cleaning up the
kAPI will happen but is lower priority.

Thanks,
Miklos
