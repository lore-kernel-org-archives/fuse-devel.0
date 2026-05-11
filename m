Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE040242A
	for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519927; cv=pass; b=q4sJaQMN4gCSu/AiJSFTr5+TEY21c/oljEy3M33r8jX5vfKX5+DThtBzMeRXmou+cNPargBhz4ne4eIcfr7SGzBW9ANFQyH4PLW7bBGQ8lWAikxB/fbdFe5Mf0VtLQDydPo+4CKh2Fmz6R8LOProUck5GEfh7R5tyd3JW54CkBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519927; c=relaxed/simple;
	bh=vTAyvt4KJAeMmvi2USwEZousoYluq1FSg5GORmp0De8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7zwIYCr1IhPc/6S/CPh6qKEYWxgX5trZahP3wmhksT90WBc7rSgdpeSsLntiGOL6OTgy2m78bZPBIkziEJ+r5OgyINDqWR1IjLw6YiT3XPIgAZJdww0wpt5gUmaeW3rl47smuy34GcutenlHmPMUkquyGIXyZLwM3JirMfenLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJbyYUDK; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJbyYUDK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so7793005a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 11 May 2026 10:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778519924; cv=none;
        d=google.com; s=arc-20240605;
        b=hnjHM7KgNEagUT1NHCwA2WICAmbjLzmgr5y5+K0OYTxL1iIYEoX8JR8fSfTeuTaAvA
         4t7x6y7r5e2R/Bkiw7YGaTgz+sysyku5sK8gd7akkOlHl88QbfTD1/4ZW36lAdas1Hrs
         t3SNvTEgBg0QArXBiN6TvwICKeXEhu9WBSY39b3x9B07WMWFZxou84RCcec+F71lA4DS
         gWwWYNAd0iU9yCm+pt8xIEWuSNGr7Ds6L6PVVNGeRNGL5NByshQugTqQvkKXReF3SzOt
         onRcgmbcstVvFQ74CYvNlhg4Y6L5sj4GxQDfOFG2qGxjwi4RXZ01wikj5ATWkPdWzveq
         M1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6e1iOP4o0+fqDTjbfq0VbT57a/DIvrGH5IJQqP3yrx4=;
        fh=wSz++QXcTQ8i/o9zEflwOq+yBsmnZVBgM4Gd2DXWghM=;
        b=dIdKSfmdoNFG5P3XBWwrcSM7ix1uj2HMrEbC5MOItdPKMY5/7KPKrnJ+eSmE52lryj
         HA+1vgWAthxyeoLr3caGbmSAiO7wPVPZWEjTaR7lMYM6STUgQazpJhbAnfVCJkhz9SsS
         6TiAh8QDC59L3TzByLQnPtIV5mpsi1sbRDKWkukKolb7wzHcDbGhtwG7lwuJdIdHUsnI
         r/tImyYvkR362UtqZ5RFPgEm4ILPp1TAONa6+v77FtM+xeQgFPN7iXeDA9zOl1IwNhj8
         /pVEPFPd8KjgERvnrJCTYHea8Jo0PuvZXeF9DIRBwu8cWY7bz3wQPUJ/lcC+DlyOFMBS
         LbWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519924; x=1779124724; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e1iOP4o0+fqDTjbfq0VbT57a/DIvrGH5IJQqP3yrx4=;
        b=qJbyYUDKOGq9G9vWSgrBmUiB+E7GkvNutosh+7or253uuag9IBVkInser6naR3AkZ3
         fvNyNwY1hmP91yBdToL66mad23fcFyM1DZlCTpwWL6kwB3Xl1/D86HnLxZtEkGIJ/tTY
         YTn5nNftdxmy7hQ4a378eNyWvtdk4BCkIS/rcs78SjqejS8gP50t5hbyoGloVV19+wev
         p3CThcuvt9LtdFmsoaaA/NS7rd1ygk5nQYThZnMjxhLRdt9e1SrHWmq/mPPAZFfMfkkT
         dK3c5INypJ9kqcz+K6RNglWVWQ4TeOwRVLiMzIcYw6a7zcV7GEvB3u9r0j3rk97Zw+1l
         qPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519924; x=1779124724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6e1iOP4o0+fqDTjbfq0VbT57a/DIvrGH5IJQqP3yrx4=;
        b=blm7zeL9w2zpPsVYqhKmhzDypoB9NZdF/Tt52zzWgq/nc0OChUt+fC6V5tuXMD01l3
         Rk1dAi2bPMLEE5Xbik8u8jBLV10uNHJ1/0vTS3cbkYH8MwIGY194y18BEGzcmoSem4SD
         D2ruKG8JLkV2C1O1sQVFCK+bkU/rcg5aa8X1lKwrI+mUZVutCb+Ty104lAKnI8pyREBy
         U0b/63jOZFSgx1TdyhvhefP4sS9CwB/kPL2dBCIrZXhWAMwNEfNUz8OmqX9yca0inDhX
         NyK5EruvaOv0rMBDjJpPzgoG45rpj6L+gWGIvtbvYfZXlmhIi8E3yDRs9NNnWY203Ndf
         ljfw==
X-Gm-Message-State: AOJu0YxrO4Jay368zIBd2koNclR2W3a4qOvDGI4pF9NE+njihdD7LrFG
	axo0PdOG5lBYShMcMIzlDjO8BEr7lthq2p/Y3Wp3gDAROvsMRPzZFosRPStpRwtJusTzsiNNzET
	FX/o5I6o1TzpJcINEZft5iJVRpWAbnvvrK8AVbBg=
X-Gm-Gg: Acq92OHkS68wESLbQAZvhLKahn8l5YQy6LVs9DVmIJRFB/jkkZgFWCLvCEUfWRmU1pi
	Z1SKe/OMr751afTkzTwxlsa5gKrS8FSUyiO7JYe6tgy0+nSPGVgvZE6pDkEizfdflXnw6zYVeu5
	XVdSDP2rvh68REAmoj65/3NXVzodwpUpcTlvPmXX1iS2ZljyfAA36CrsWWaNLpVa1l8zdgtMrd/
	u7BZnexrmE1ZExay8UQ9as3XtJyyJr3m8PXt6+NsbyV6oHqcyZbW1wXX4JBZVpPM2RB2EAwouv+
	noX//yVYOxX01dsV2BhLMDDOe5aUq4trlIzVEcXwdsIVZgeWEVKmswZ7rZaCkQ==
X-Received: by 2002:a05:6402:3509:b0:674:37b7:227c with SMTP id
 4fb4d7f45d1cf-67d63aa055amr13016647a12.2.1778519923727; Mon, 11 May 2026
 10:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
In-Reply-To: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 11 May 2026 19:18:32 +0200
X-Gm-Features: AVHnY4J2LowBbggJwZFIYxcstb6YO_MVN_SJAWnvOEiWS4HFZUfxz_BmmdOmD0k
Message-ID: <CAOQ4uxhnOEkX4qnn0wHMCqWhEeAGTR9rxcw5u_oqGUovuszo0w@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel <fuse-devel@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	John Groves <John@groves.net>, Joanne Koong <joannelkoong@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, 
	Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 5:12=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> Please let know what I missed.
>
> CO-MAINTAINER:  Position still open, though we formalized some
> subsystem maintainership roles, sent MAINTAINERS patch.
>
> FAMFS: Let's try to find some common ground between the fuse-iomap api
> and the famfs api.  I.e. add striping as a generic mapping method,
> even though normal filesystems don't (currently) use it.  Using BPF is
> a bad idea.

IMO, FAMFS sits somewhere between PASSTHROUGH and IOMAP.
The simple nature of the maps, the fact that famfs maps are const and
queried at file open time makes me think that famfs is much closer to
PASSTHROUGH than it is to IOMAP (in its full capacity).

I think Joanne has mentioned that her customers have a use case for
multi backing ids per passthrough file and I assume this would be a pretty
simple map, so that sounds pretty darn close to famfs already.

>
> FUSE-IOMAP: Need to reduce the scope of the patchset further, as no
> one can sanely review it.  Idea: first just implement static maps
> (i.e. read-or-re-write-only).  This should be much simpler, yet could
> demonstrate a read-only mount of ext4, right?

One more perspective regarding FUSE-IOMAP which you mentioned in LSFMM:

wc -l fs/fuse/* on current master: 20875
wc -l fs/fuse/* on fuse-iomap-fileio: 25325

We have just taken a tiny bit of load off you by sub-maintaining
2200 LOC which you are less familiar with:

$ wc -l fs/fuse/backing.c fs/fuse/dev_uring.c fs/fuse/dev_uring_i.h
fs/fuse/iomode.c fs/fuse/passthrough.c
  179 fs/fuse/backing.c
 1371 fs/fuse/dev_uring.c
  211 fs/fuse/dev_uring_i.h
  275 fs/fuse/iomode.c
  197 fs/fuse/passthrough.c
 2233 total

Merging large new features without a sub-maintainer
is likely going to hurt your ability to keep your head above water.

I realize that it may be hard for people to commit and that the atmosphere
in workplaces is of great uncertainty, but this is something for you
to consider.

If we are being honest, then we need to develop features that users need
and if users need features, there are usually employers willing to pay for =
the
feature development and maintenance, if we let employers know that this is
what it takes to get their users what they need.

Thanks,
Amir.
