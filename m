Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB881A6824
	for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017084; cv=none; b=hxosVguyroi4qaeBKdu7yoQo4liNC1uDn3m9nedFyyHDQWsnPtGMiRksuy+M9SYcTsOJGEmmZRL/xGYasqxaTDELG4983CJYWuF/H/Bmmn3ee8zpdq6O5vSYtyu0gJa+dtCXjzVL+VDNZqrtHOzKNdfzRAobZ64EnG/oDYRn3js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017084; c=relaxed/simple;
	bh=Aequle+K87LGAu2G8+oSYuEOV4qqi1oUcMRMjLloAYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0l+w2p4OZBkyQCm8ffSp/uMMDUeqCySrxedzvQFF72uV4s/kBhNrh1fOs1zXJSPvrpyvKwX67MycIdXLbmmo6D6BjNxpKnB4uEHH4z6B0vjtKF8LxK2RDFgpBOgW8wIu4w/KjwbGqRJ8haQXj3yoQsVwPukGdrNJipguLKWAeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6NTDVYe; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6NTDVYe"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-676d8582a13so5994467a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 24 Apr 2026 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777017082; x=1777621882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twEiYOl7aJEMeKvbP9GxdxByZHNRVmRPNGJTbqs2auY=;
        b=q6NTDVYei+NQhBTs//+matt0k1T1t96cqqsnciPHeF6DjDpJdILFWDkPNIkWH9qlfl
         bz9cbu4gW/0lV9wIexUrZWg1+DaaQuqGzamP/Kh7kUBCNPHUVxtJwe8fB22UFlqzEuLh
         o2UhwA1LvQVoR536k4WRM56L/ZXzW27aTdaoTOCnwYAodO4djkTdYHGpxWteKXDBWdvz
         sxmqZs1W0IhZJSbQZGT1F7GGOuWxCKbjTeDrMTCFmqU0E3RzU8FgyVmL77F7tpojE/gj
         lekN3kNT0GBL5DSPRpd/YPqdwfe20ZIgLk13JMYqY1N7qOjQCbHzHcYU0nMlLzPXyyMA
         0sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017082; x=1777621882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twEiYOl7aJEMeKvbP9GxdxByZHNRVmRPNGJTbqs2auY=;
        b=WLKeFH/UZk2cX3xn1qDyokfSoggSAh58BdyPwZpmJmfwiWwT8+Z31t1SwG1iXym87z
         opMymp60KqLdqpJsrOd7Z5cUI2yRBJaY20uZdNj9MMRzWINeUsMHjB/V2Uv84YXfQTlD
         9ZfBsCa27tDcVKjvKOUJrb8vBjZ2XzFoxaVT1Yrv9exFsm9eElytbDLwkSM7gBkaGijr
         wRkk9ooK6gW278VfKLoOpd046f4HewfruPCjKmbcAVmeyWC18KkAOGpKSCakVIPoSpSz
         g/N++iu2OMOdQtLkblBdarG82LC1eKVGmRGxJI56ELWXj1trsFwywMDNYi54jbvZLHvo
         k3Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9kIPUc8LXouKhVi7vbj08iCIITVf2gysQBLjThOhmZgIPrNrtDHaG+VdyakdeAN+HkxENxJKJvB1nv@lists.linux.dev
X-Gm-Message-State: AOJu0YyivikMsltSqPsznaYhJZ+c1DQ25cZAn+HToeL/VE41hS4DCQRD
	FiASJ/oe9aVmMc4oX3ORAkfDMENCD1ut/c5O+Rc5tz1+ghfTaMgwkAEPGzawJlp2
X-Gm-Gg: AeBDietHx+86DloIafttFDTAMQCqosLvQQOU8ViSOuwzttlZrcOvI+I6voF5OExNuSa
	U6BA4y1xvpnBw81bI/KXbz2kgad0xytaS8Pwi4tgR5zsCf2fcdW8EWe6/xsLpL1RYDIPldgoLlL
	hTBNc8Asg6iDSCGAOvDvUR98C0vbTFLXeeADLqUmuDGTGfc+7t560Z7EKlv0Pnjc/EfTH2pGgOg
	phpbgPgOLgRmHd1nonv1pOw3JeTLihbBT88ThiGMzs09PlfzVnuoDvetaayjsngWEQ9BtPcP+gU
	GJu92VmfwsJQIYRnyLcphYwJFCRRswMSW6HAIzgGLWCZOVvNYXp7GqZ3NTuUeFlySq3Imq4qsiL
	U05whuS0D7xkCwIWzTfx2umrNbCcBTG3hZCu0nM53U1b/OkXpMbqGk4GaVdnxa0Cp4qR7XQX19y
	r+oWvmECHp9zdV9yE7arsTo3h+xmYDIoxNlP+Z3xAzco78DMLyrJ+FAGdqY1x+8g8IHHTQm7sf0
	/m2oEKGC4bELus+OQZLD0IwBT5+0AFlaNHJtUQ=
X-Received: by 2002:a05:6402:2792:b0:670:8b7b:51b1 with SMTP id 4fb4d7f45d1cf-672bfd86d94mr13309216a12.3.1777017081753;
        Fri, 24 Apr 2026 00:51:21 -0700 (PDT)
Received: from localhost (2001-1c00-570d-ee00-4aab-734a-1928-df3f.cable.dynamic.v6.ziggo.nl. [2001:1c00:570d:ee00:4aab:734a:1928:df3f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d6f63fsm4624633a12.31.2026.04.24.00.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:51:21 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:51:20 +0200
From: Amir Goldstein <amir73il@gmail.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v1 00/13] fuse: dir.c cleanups
Message-ID: <aesg-JcefprjeQfd@amir-ThinkPad-T480>
References: <20260424011646.457682-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424011646.457682-1-joannelkoong@gmail.com>

On Thu, Apr 23, 2026 at 06:16:33PM -0700, Joanne Koong wrote:
> Amir expressed his unhappiness [1] with some of the code structure in dir.c,
> particularly fuse_dentry_revalidate().
> 
> This patchset is a series of cleanups in dir.c. There are no functional
> changes intended (except for the first patch).

I think this is not a good idea.
These sort of cleanup (e.g. removing unneeded gotos) are a kin to
whitespace cleanups - we should not do them unless going to change
the function for another reason.

The churn this creates and backporting conflicts are not worth the
win of the cleanup itself.

Therefore, please drop all but the fuse_dentry_revalidate() patch
which should be part of your passthrough series.

I will review only this one patch.

Thanks,
Amir.

> 
> Thanks,
> Joanne
> 
> [1] https://lore.kernel.org/fuse-devel/CAOQ4uxgCezMh3jdp519Lp9OZeqAyZHmc4Mp3FthJpfXhVoHEfw@mail.gmail.com/
> 
> Joanne Koong (13):
>   fuse: fix missing forget requests in error paths
>   fuse: clean up fuse_lookup_name()
>   fuse: clean up fuse_lookup()
>   fuse: clean up fuse_dentry_revalidate()
>   fuse: clean up fuse_create_open()
>   fuse: clean up fuse_rename2()
>   fuse: clean up fuse_time_to_jiffies()
>   fuse: clean up fuse_link()
>   fuse: clean up fuse_do_getattr()
>   fuse: clean up fuse_update_get_attr()
>   fuse: clean up fuse_get_link()
>   fuse: clean up fuse_dir_open()
>   fuse: clean up setattr()
> 
>  fs/fuse/dir.c | 324 ++++++++++++++++++++++++--------------------------
>  1 file changed, 154 insertions(+), 170 deletions(-)
> 
> -- 
> 2.52.0
> 
