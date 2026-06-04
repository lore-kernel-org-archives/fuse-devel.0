Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7B3D1711
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553581; cv=pass; b=pcl/effooyWgwtKaWS3568oYg/tXoJzh4m4xTGeTZn9/zZw4Zq51M4qSX74dr1F3HHh/wgp4/BPhvHgFhG3ROkv3ImZ4jW/lZS3CB7fnuWLUL79188KZ/2v8pj7zktf8zVMZ/1uHPYGNvd002nMAGXVQNNUbNk+rhBIS/6EN+Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553581; c=relaxed/simple;
	bh=Pr6wlWNtLQMgQzyy9L6pkNg4ant4ewsf7oEzgRwNQaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NxYIBj9YPlZY9NrYqmpXgGMgIBYuYxf75Jtw0atTjs/TS9Kh4DbMyTrl0l+58G7sPpACVCPc3XbEa1hXGXmXuUeLJIyzHLyDIt7uzIiFrvxgOCklG3OKbbjbuPfmPanIMliuIYbxnkxDs3c8jd4zax+1vCjlL1VM11R45RA9rNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CyugxUYs; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CyugxUYs"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccea53f35cso3896066d6.1
        for <fuse-devel@lists.linux.dev>; Wed, 03 Jun 2026 23:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780553578; cv=none;
        d=google.com; s=arc-20240605;
        b=TkrgV+ChxWEyCOID6DlFWw8U37uZ/6xNGFhRsqzDlhDw49mtz0hI8INK2dg2m+7/vs
         vbhrh9LLGEbT9F/TQX48460QB5vD7xVgCbXzuVtju14u7gyC/Q55T8TCoGQZe4ykyjUU
         wqb8nI8XRN71qKu3+AK4iVQy56QCdfxp4iWFDXzy0hFGIpkK3x1ppjqTpjFsiUf83PVv
         03uqK1D0uiE+lXQIu9Qsn3iQaFdJtUbzQfMesfdT6+4GqY81l4Xz8VibQh/VNb8Sj4eu
         ZMhBFe8Xr7KB9J5MDAwxKxalpEMpcfmKUSfH9ZxLVzHwvhHhkp/D2nqDLnEdYc4cXliV
         5YsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I6AF20u17yK8lsLHY26JLuWUs1jwFfZ2TsdktDqCk5w=;
        fh=kdbOMBBCIIvfTuZnZA7KEWZlUI2wg2ontSFUSiCO9J4=;
        b=DNBk+GuRP3AOIbcEfNd49lc3SzgjLjv7wg0RT9kOatHMW+TaWMI/5q9s6ZC10R8czw
         vkkbjUKe0XpSZC2mU6itcNIL2t3IzxdIKvfkBWquzByF/C81AeUNJ8Em0n6p5BKWBn/B
         7PvNrsOcvrUYqmCsrUWb1vNWrEmWZGY45W2Zpr1aMeTA4qtrLiZYm1gSkU455Dx5yWUm
         Rn3mUsZklmylSEbuG23+6p7KGSmJ6QjUzdCQv7scPhCu8wHTXA7y8liDWqR5Mtjlhetc
         nQPJTo9mIAuhR2Kdxdw9J04NWiFXuz/UqM9X8uh5SL0H/nww3fuEAPrS5whPa1LVHJNH
         bDjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780553578; x=1781158378; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I6AF20u17yK8lsLHY26JLuWUs1jwFfZ2TsdktDqCk5w=;
        b=CyugxUYsPmeGQ/9dfx/vfLxxsBmi7OcSo7FTepee9ilnu7v1yLcDOdMLRBIG+KncHG
         vLGqIFMp8fMjhPVnLvEzj1L0lW7vHGpgYLI6N1ZfR3qGpnpJ3GpgM1nK/JWLX+ciD8xk
         344baViIOPGSBkGmoxpMm3VKYP12ISYA+1rXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780553578; x=1781158378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6AF20u17yK8lsLHY26JLuWUs1jwFfZ2TsdktDqCk5w=;
        b=iwDSKoirO5kzS0a9cSC5brqnmcLgcu2R2PRU/l9+F0RPghgm40ZldFAD8T21cGKHMf
         j9B65ZofQV/ZteLCLNwRNn4p55MomBSeOQSfXDpCZG9ivJlm/xe5wbRInOh6GVIGonsJ
         8j5yQF9z3Exq72ROIikeqylTVb+2RXmSyrRXoiSV4QIvwB7dgCzCrZXQB6TJf8Afia3K
         zCaT454lDYBJbnGpw9o9qGgZpXYE7NCGv6MBd7CgbcKcaPGph2dJokZEi64cSaEU169K
         7e0ZlvNjSRas7QkqN7QMwrsKbPtvLm7cGDVaC5R/7ncbSE7Xoo1rCkPK3LLHyMwF3KLW
         IFEw==
X-Forwarded-Encrypted: i=1; AFNElJ8R19MwrJ42w/ydMJLz/ZjJyEArSygHRIN888v9NCPzMgMPgPg0Hn2qrjVOPzAeoZCGia2A9hrkVeWY@lists.linux.dev
X-Gm-Message-State: AOJu0YyjDqmJiLZcMb4cjCQ8fh+UJ9NCHMQCubE0nERzjMl/156eWl1D
	M4ALoKWqDspQ0IBqMApq9K1+6BGRHI3LQas4+7O+L/CZaHtkFic6jcnhCn0gfbs1bjjkaF4dUuI
	nuDRki6m1WI8OaGNbKUAvaQqfrfnZek1SXsPmkPvtDQ==
X-Gm-Gg: Acq92OEIeWaWTpcmK0r4DllRXWHtDyj/47qeQATTLXM9uNkTatR/8mW0BxTjqqeq++l
	HMh2p2AGn4V16YA/Ju8MoE0pJ3p6yCyNBjA1Yz2weJt/+4Tp1aeeM6H9YTYsJGpZ9pMd6nTL+5J
	dxmrKZg1H1iDPJ3L7sm0CFHEtfLN7WDoy4hiBsOH3CeD2WHNgBiLCyUc+FzIALTGeBV6mMHEW4H
	ASvosFCdU1fg/OmEp8IStranzknraWdxrcDulF+3AL/ZYAWHpNG9RaibTmx982URqU5QD97bMHV
	KWoSDeKUXOCAQHNvP6LlZvwQLERqaSoFT2SZ4wrJVYoJ1fc=
X-Received: by 2002:a05:622a:205:b0:517:6378:e671 with SMTP id
 d75a77b69052e-51778746f36mr88994211cf.55.1780553578434; Wed, 03 Jun 2026
 23:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601152327.2069787-1-mszeredi@redhat.com> <CAOQ4uxjFg4rjwGjU2LvZT6AhC+gBk_6Ej5S4p4DKuk8=a71cRw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjFg4rjwGjU2LvZT6AhC+gBk_6Ej5S4p4DKuk8=a71cRw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 4 Jun 2026 08:12:46 +0200
X-Gm-Features: AVHnY4JFCN46EUQT35mtxnUuo1ifXK0J8GC36CfQAJf8_uFrLKrhycYqfsAQQHA
Message-ID: <CAJfpegt5Q0nmK0JKAfa4Bp_SydR1qiqu7pB0JKkXSCFOYSVDDA@mail.gmail.com>
Subject: Re: [PATCH] famfs: FUSE_FAMFS_EXT_INTERLEAVE -> FUSE_DEV_IOC_STRIPE_OPEN
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, John Groves <jgroves@micron.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 15:21, Amir Goldstein <amir73il@gmail.com> wrote:

> Considering that John wants the daxdev ids to be allocated by userspace
> I suppose the number of daxdev ids is limited, same as with iomap
> backing devs, so we could probably start allocating backing stripes
> from max_daxdevs (1000?), to be negotiated at init time.

This doesn't belong in the kernel.

If we really need to have allocation policies for backing IDs, then
just move it completely to userspace.  I.e. pass the backing ID in
fuse_backing_map together with a flag (FUSE_BACKING_ID_SET).   It
would make the open/close more symmetric, and is a nice flexible
interface, so we should have done that from the beginning.  But I
guess we opted for the kernel allocation scheme due to its similarity
with file descriptors.   Oh well.

> > +       res = fuse_backing_id_alloc(fc, &bstripe->backing);
> > +       if (res >= 0)
>
> 0 is reserved, it cannot be allocated

It is confusing either way.  The (res >= 0) is expressing the fact
that this is not an error value.  If the condition becomes (res > 0)
then the zero value becomes an error condition, which is crazy.

Thanks,
Miklos
