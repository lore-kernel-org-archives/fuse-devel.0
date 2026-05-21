Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B88B34B1B0
	for <fuse-devel@lists.linux.dev>; Thu, 21 May 2026 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355678; cv=pass; b=UUyZW6hnuJoEKtPh1ei3CsH5so6fOwv7We53Md2ztyZ43pUIKe99InfuUESyOuWfyHpIm8uu6U4goBTYdZGTBSSRz08OpuLZjfFvFJEEil/oj4fuOZCSJ3YQ/1ge/V4BL1FEOMfkxDGkKRJS/09cj6Ml5u2BQ84E4lIneToEmxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355678; c=relaxed/simple;
	bh=5r3JyqQ2DBLFlDYBRZC2KsaiyevYXDeDtmnIYAMTEJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVbiVLAKkuLFwg/E6T6cKxAvl4N7qGcpvmdcdWa6H2vUlY94ZrJgTFM2Ucyoq2JXn6lSzrTTGCpeDu91tkU5FbXB+aZWzc+NctDF5D61zpNKkn8kGZJnlGgbajpUF9o9ZWIGbNLpqXlc+qFB6pGfi3D5UBpdNunIO5LJMQAWYWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KV8MgP6v; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KV8MgP6v"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so11953439a12.3
        for <fuse-devel@lists.linux.dev>; Thu, 21 May 2026 02:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779355676; cv=none;
        d=google.com; s=arc-20240605;
        b=kn+zwx9XEBq7BQ871hfAWlp9PemMOIU1g2hd7BMeCQuYNh6FBg4nJddwsZxNES7iR7
         zcvL2EzFyvT3QTi628xCw0kD66sBLHmgoASjd9pI/5ySrbpl0vkxQi1qyXquHXYeKdWJ
         cirOj6v7YI6X4e1Njd2hFISxxWZjErEmmx+E6crl92WyN50uael4q1x6uAQWNthK2lCA
         lf0Z6BzFFI4zCP9kKDD+Afw5OYhyTBzMv+j5vukhxA9+9/cQVPQijg4pKM2mzamYcfsO
         +ZRM5WxKIqrCdwepjYLMRAH6JMcg/qYds7xH19pQPxvbNsiazcjxpTMZP+qY0ZCz/xBT
         xOsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5r3JyqQ2DBLFlDYBRZC2KsaiyevYXDeDtmnIYAMTEJw=;
        fh=eS+ZYlluxurFYh501YlIrKIPEOr7xGdSGa4z/dFXWMM=;
        b=N5lql+TntGprds/PP8pF8MWzoR8nJFyoeCtL3ISbNskhdIj9AUSsZmmkZesCuS4sLk
         /IjJ7CIOIk5rCbEWe1zeq7wfaHq12JkDDxgKHakJTF7GpvYbO+dseMD+87pBiXSyirwL
         d9x/E/XeFYNG+m4Dg+6LNO6JBK5M6aWbW/uIa60TxYT41wXCMnO2I4JOqIg0Sczc0rxG
         j2UudUAJkbQRwz2KnhwWSGikDAi1GoxhwXtjS8kugVtLrF5soAIKIgE9m1Iv4+YtqT9z
         eY+YcRXv/NbSzSWBDGsX4KTs6E34Fzhnayx/PBCMJgIV11JNa1LQJN/Z94E81uo0c1Mg
         UTYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355676; x=1779960476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5r3JyqQ2DBLFlDYBRZC2KsaiyevYXDeDtmnIYAMTEJw=;
        b=KV8MgP6vI1Et2wf/gXJZjMAnG9IbSQKbJ1o4RsyyG8cCkAcJhjXBF/N40Fnx9dA0jc
         7kGDKYXl9cvzWc0T2P8w1KS++B7Qe5FFduuH7c0A4o5sFbPSf4ceNWej2nxZywau52LI
         T95CJkdDjmPtifXv3dbrjRrs9IBWViaN6YTWfyb070L2bHJkU7vBasBJli5y1qlODEYR
         My/cGElp3wFWlenZihpikLGUTYMBxJV8zJJzh2rhK4+68p01WuqlP4c08hsBt/r0BBN3
         r/9itwi+dWyQwUW4qnizeByvsCCgCmjqD75dZaJFioblClSik1RWG22L0c/RzRulgX6o
         tOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355676; x=1779960476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5r3JyqQ2DBLFlDYBRZC2KsaiyevYXDeDtmnIYAMTEJw=;
        b=iGqmF+n3NOb0Ne8EiTlYhd7hM93lUiAPLMqsMqPk9CzlAzDEUibtnVkooEDx/l2vqx
         1cu3ZVAar0PzxasjfYwnW/sVSFwgWqu4BvjcnCdhmVjH626aK9HQuSM//oknjvVbe2Hz
         HJ03rXNObNyWKN6vnxiLixV+wvLfrpaOJ3y1ahzw9oqIACXpVyXZtP7pV1KCYKLSIvBf
         fAMlPYLyXQTWFuTKOi3NU5tNzp/0K4xwZZ4lBia57xJWYe/lYTnluY6CTgOJ8aYXThxq
         H9pSHAa3E7PXgo5At7IUeWUSOuQjppyTMewriuo6A/MW5FO7/QJXWnTW+noFDn+Ga4Hj
         kXNw==
X-Forwarded-Encrypted: i=1; AFNElJ/859Kae/waZ26T2990XKYqsSDR5Fthy5qPPoMwYZuJF2ONoBGRN2TkoGYlL5plyg110Ee0fh1elMJZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxZQAO/no0FiD9v8v0w4OFBiw+RP0ppfYO6POYDJmkshXSVqVGK
	DXCopDEoy0gMb8ekOL1EV42lAm5AbIK8WLGkuqb20qa5piBLpGeBf7uWx4vLytzPQ8BCj95qh/e
	iMUJMR6fgKV0BVQgtxZlra9LHqqdXmog=
X-Gm-Gg: Acq92OGdQjvxMXcAGWr5y7HHlQVuwt3b+aPOPW1DQi3Rj9OA9Aa2WjMQcMKVmjWWfBv
	+8FfQBZ26nUTp1W/2Cf9zwmmmA6UdWsNromUOotowl8W2z8cu+IYWz5nkHpQUzoT0gjH8IWA4qi
	rTHW4Oi2F7uVRxFx9GBUCSDIJ5kG9wUi8+iNjH2OLpAc0E44GmYn94LwkqSDXC+1turTMOoGjeE
	BCUVg5qfDDTVv7FrN2T9cc1e8hDTSKPvtsa+sly8q7IPlWF/bvSPomVTntQeZgdlup4c0RTWf9D
	bLgKyKHtr/9Mxdn3nhuszEiaqXTnUj7Lk/M+BDnnPg==
X-Received: by 2002:a05:6402:5017:b0:677:15b6:4d6b with SMTP id
 4fb4d7f45d1cf-688369ca689mr933762a12.26.1779355675390; Thu, 21 May 2026
 02:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <177922944800.2436629.7011047808676668088.stgit@frogsfrogsfrogs>
 <177922944866.2436629.1081840703046716342.stgit@frogsfrogsfrogs>
 <CAOQ4uxgnJbbTBup7UDh4R0AStx5hL0DYY09Fk7g9ETJehopMmA@mail.gmail.com> <20260520200136.GM9568@frogsfrogsfrogs>
In-Reply-To: <20260520200136.GM9568@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 21 May 2026 11:27:43 +0200
X-Gm-Features: AVHnY4LarLJOa9Aitnqdx661hv6mfV2CGj8oqgXWw5qclnUF50Ke7Cnxu6Pitb8
Message-ID: <CAOQ4uxhfy8if+u3o4KSkGOF-zmA=Ci5SYsdxGEY1DRNi79ZQtA@mail.gmail.com>
Subject: Re: [PATCH 2/4] fuse: store backing id in fuse_backing objects
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: miklos@szeredi.hu, linux-fsdevel@vger.kernel.org, neal@gompa.dev, 
	bernd@bsbernd.com, joannelkoong@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 10:01=E2=80=AFPM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Wed, May 20, 2026 at 09:55:24PM +0200, Amir Goldstein wrote:
> > On Wed, May 20, 2026 at 12:28=E2=80=AFAM Darrick J. Wong <djwong@kernel=
.org> wrote:
> > >
> > > From: Darrick J. Wong <djwong@kernel.org>
> > >
> > > Make fuse_backing objects know their own id, it'll make tracing and
> > > recovery of backing ids easier later on.
> >
> > The problem is that in the context of fuse passthrough
> > backing_id is just a temporary integer name of a fuse_backing object,
> > but fuse_backing may outlive its backing_id (e.g. in fuse_inode_backing=
()
> > and in extreme recycle situation a backing_id can be reassigned a new
> > fuse_backing while the old fuse_backing object is still alive.
> >
> > This only makes sense if backing devs ids are never closed, so maybe
> > only if FUSE_IOMAP and FUSE_PASSTHROUGH are mutually
> > exclusive (did we do that??) and FUSE_IOMAP never closes backing ids.
>
> In iomap they're *nearly* uncloseable because we have no idea how many
> iomaps might be floating around (either in response to a
> FUSE_IOMAP_BEGIN; or in the mapping cache) the system.
>
> However, if you can knock the number of iomap inodes down to zero, then
> you can close them.
>
> <shrug> The self-contained id could be set to 0 on idr_free, so at least
> you'd see in the trace data that you were using an un-indexed
> fuse_backing.

sounds good.

Thanks,
Amir.
