Received: from smtp01-ext2.udag.de (smtp01-ext2.udag.de [62.146.106.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88547D950
	for <fuse-devel@lists.linux.dev>; Fri,  5 Jun 2026 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.146.106.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647115; cv=none; b=Rjp7OWrugOTuZZORlEkoxpLyW85nIakkxP14YcfL76Hy+01l3FF0mmHSRmLDRkFO6P0CD2ortrmuvnfDu88BMCwvUT+qz0bkXkuJo3xEX9/e2j6k/R1P4Tjt4oUNOswrwN5eUHPGqGNvbcN6nhHUKy+sLzBTnK5py24tmzbCgNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647115; c=relaxed/simple;
	bh=99horYYel+XnjflGyToF3UOxxwVSaj7jPocNodLA2RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzMiZM5cCO6K60AfBV5VcRk3KjguiZjVUUjL/GFBWMpJ4N0n/AV0sS7K91gbZ4WJj0/YaUifhYtxCiZT4L4UaTR9EdkJTfAw9iwRfUd1Q9/D+SQ4tJ4vDJfH52mTtC784pfqxBXCDaq7vGJ5vhcAcfvABtqAuXsvOM6CNXwuay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de; spf=pass smtp.mailfrom=birthelmer.de; arc=none smtp.client-ip=62.146.106.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=birthelmer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birthelmer.de
Received: from localhost (065-142-067-156.ip-addr.inexio.net [156.67.142.65])
	by smtp01-ext2.udag.de (Postfix) with ESMTPA id 8DF0EE015C;
	Fri,  5 Jun 2026 10:03:17 +0200 (CEST)
Authentication-Results: smtp01-ext2.udag.de;
	auth=pass smtp.auth=birthelmercom-0001 smtp.mailfrom=horst@birthelmer.de
Date: Fri, 5 Jun 2026 10:03:16 +0200
From: Horst Birthelmer <horst@birthelmer.de>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Horst Birthelmer <horst@birthelmer.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bschubert@ddn.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>, linux-kernel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, Horst Birthelmer <hbirthelmer@ddn.com>
Subject: Re: Re: [PATCH v7 1/4] fuse: add compound command to combine
 multiple requests
Message-ID: <aiKAFROMoVuk9Lzv@fedora.fritz.box>
References: <20260604-fuse-compounds-upstream-v7-0-27331d085c2a@ddn.com>
 <20260604-fuse-compounds-upstream-v7-1-27331d085c2a@ddn.com>
 <CAOQ4uxhGGUroMpTdLUEdKZd-=uefVoQW6Fm5_WX2-6S9T1TUmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxhGGUroMpTdLUEdKZd-=uefVoQW6Fm5_WX2-6S9T1TUmA@mail.gmail.com>


Thanks a lot, Amir, for looking at this!

On Fri, Jun 05, 2026 at 09:41:00AM +0200, Amir Goldstein wrote:
> On Thu, Jun 4, 2026 at 11:51 AM Horst Birthelmer <horst@birthelmer.com> wrote:
> > +/*
> > + * FUSE: Filesystem in Userspace
> > + * Copyright (C) 2025-2026
> 
> Copyright to /dev/null?
> 
LOL, that's a copy paste error of the header ...

> > diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> > index 5dda7080f4a9..7b20e4e9971a 100644
> > --- a/fs/fuse/dev.c
> > +++ b/fs/fuse/dev.c
> > @@ -413,11 +413,47 @@ const struct fuse_iqueue_ops fuse_dev_fiq_ops = {
> >  };
...
> 
> Move more of those compound helpers to compound.c instead of bloating dev.c
> 

I completely get your point and I will change that. I just thought that  it would be 
easier to 'review' if it is clearly visible where the change is done to the normal flow, 
since this was one of the main things for this version

> > + */
> > +struct fuse_compound_req_in {
> > +       uint8_t         dep_index;
> > +       uint8_t         reserved[3];
> > +};
> > +
> 
> 
> It's ok that currently only nodeid (outarg[0]) is propagated,
> but I think that the UAPI should describe that this is the case.
> Something like this?
> 
>        uint8_t        dep_index;
>        uint8_t        dep_arg_idx;
>        uint8_t        dep_arg_type;
> };
> 

Good idea, I will add this and let 0 be the nodeid type(?), so that the code
does not change ;-)

> We probably don't need to waste uint8_t on dep_arg_idx IDK
> 
> TBH, I did not look at NFS/SMB compound protocols, not io_uring
> command chains, so I would appreciate it if you include a survey of the
> state of the art in other protocols practices for compound commands.

OK, I will do that. I don't remember how NFS does it.

> 
> Thanks,
> Amir.

Thanks,
Horst
