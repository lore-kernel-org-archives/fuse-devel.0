Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090692;
	b=42kbPseE2x7EIp3BhRcPRYJm9BtLTjy4GI4WIsaQj14RraibzZYUmiE7HcvJiVSD0n9Z
	 2uOFSKca8Vy2QD4VNlPywoNGnZed0Yr2zolofAYFaJP+bQ/Pbc+Yr/OP5t7iPwDmltqLx
	 EH59Oafo9imGbWPvxS0BKOVUZYMGwi4HF2tCqit2wUMWFRB1Ss90SHwFFT8Gw/pxLg5bg
	 9VQQtxk3BtOuOc3v77MzwrkXTIFKbZ1Q5xmM2o8CaDQYkPEtm5fd8TSZzEtiC8Fowjc9l
	 OhWdaGD+LHmV2SnFV6jM9o0Ug8E2QpTtEC9y7ymrnFnUWzHD1DNynYei+qVkdIQ+v7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090692;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=gqZVLpTgCP2ySw8awFBFsKWriU/az/ZtPImm1nmYhzQ=;
	b=XiS7I0jeSbKHiD7z1+1l8C7Db/YbLBfgzhIgpEz8k+W9cb1ezahj9zHpHofvtD9lyEcA
	 5Nsm9NEtaHfLiGYy9WCUmjm3YyWgUvI3uvrYRmV5SukT0ikCu11WSB/jlU4ueOy8fUENi
	 usmFjtfvfr14sm7auFIZgXz//Zq0qPGJPgCv6vqW9P7iDMzNgSWMQ40DnGx5BhNvoexSn
	 xF3OS1RZ10lXNuxaOUBFRor/BzgMu0yLMdRNWnTA+xy19ViZxQLcdKJNI2cGxJzC2PmoQ
	 IkpyJFtdoN+xTU+hJN6yWD55Al8RsccFMdiPorKYFgZBggc9FPJlnCAJm/VeJcNO06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVOWvP24;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D7606A32A
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 12:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062D7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVOWvP24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795090691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqZVLpTgCP2ySw8awFBFsKWriU/az/ZtPImm1nmYhzQ=;
	b=VVOWvP249gQbGhATtzKUMg0j6A/tChNgM6jO1Wzx/AIp5s1eeCFdIDmMi18SOLWYhJ7m9Q
	rNIwphULxYcsY2zcibeAN2PgqHM5Qtp28R//iOmuShffADY/CVLIqnSe3r7UUPwPkLmGtC
	V+TK597djrbR/oLLHzUarUCTnIB8KPE=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-JpghH4_3NC2BlCG0YJT28A-1; Thu, 19 Nov 2026 07:18:09 -0500
X-MC-Unique: JpghH4_3NC2BlCG0YJT28A-1
X-Mimecast-MFC-AGG-ID: JpghH4_3NC2BlCG0YJT28A_1795090689
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67dabc6d5dfso3334097d50.2
        for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 04:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090689; x=1795695489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqZVLpTgCP2ySw8awFBFsKWriU/az/ZtPImm1nmYhzQ=;
        b=yi/PMloNDqOyvCuUpn/Fje2DESD+I6GKtV4Ne0I7AiZlxDfZuCQjt0cURX/7Qc0/Jh
         Yi/XZgm69tKu4/VIscFGWzAUWOxHm0FtDJWe298qvU2bNHcLGFVE8b8PmrZ2hRAZH2D5
         whmHfqR2H7+JHzAxc2QcSVZ5tv7T7LkH5buzc61HiKeCXXY0/xI8uy/en02b7ZgGUoVr
         o6E9tKkNDYTuuA8UQUnEDmgvfz6mFKDhRlDhUE/6YQM311a4bqkZMN/JP71k61BoB10o
         UrYHJEjR2/FD13t220juqnSN7L5NCEFrcHUNz/xhfbfw4+kGJupz94Vj5DLEROIH2x5i
         OxQw==
X-Forwarded-Encrypted: i=1; AL+hErG4B/NAtLX12JvZYtUVlo3RFiv8BUsfd7WTXUND0ue6/t/0SOxhAo8WCHDFCkDgLj2Z1jWrrXMuqSlV@lists.linux.dev
X-Gm-Message-State: APuU4Z/nDUkIp1be48J1Y6aV/tOFgaRGIE2P+uN4RjAEAMP96iwO/p5h
	DVvIMDRWS2K6mNYvTJg6TJvCIEABB5P//xfX0rN2ouoSXNzeNkY1o5VG2LVE2V5cbBBKMFJcfXE
	d7aMG5+DTv+SAAyPfGitZmg8HsssQgXIpCNQ+DoYY9yDeoYgvHugw9oIbc+pjzi2OsO7/QJi/Do
	COd2WvUuBOaEqzfkhtb8wRsMpsXI0ASFo3QyGsMQ==
X-Gm-Gg: AZFdTZePHMB7qgUAA+qYqdXXZSLNBvi6NaAtuIbGb+roskOEwcGbZcai2nvZdnIfC3Y
	QzqENd2j01IWmSBLuQc0IREv5a3/Zlt4Ebt5GvztzootrGyCM3JAJFbTiMfMohglIyzXZ3HyoTD
	xZkNK+SvG0uTGVrMN3Ag57xFC+C46UCjg0M5TuH2h3pL0pue4TPQ+sI7+ZBJ3qTBsmhiYj2vuSK
	f28mpSmIoTsw3NK77IXKB1fV1z5+v11yaKoE5wW1SXt1A==
X-Received: by 2002:a05:690e:806:10b0:67d:a6fb:ceaa with SMTP id 956f58d0204a3-67dd3f193f3mr1716897d50.19.1795090688891;
        Thu, 19 Nov 2026 04:18:08 -0800 (PST)
X-Received: by 2002:a05:690e:806:10b0:67d:a6fb:ceaa with SMTP id
 956f58d0204a3-67dd3f193f3mr1716866d50.19.1795090688232; Thu, 19 Nov 2026
 04:18:08 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116171044.6938-1-jack@suse.cz> <20261118145941.1063127-19-jack@suse.cz>
 <CAHc6FU7NoZua98SGP9Kuga58gAcco6X__u=kOPfsUqbefAKLFQ@mail.gmail.com> <wo5723b7wrmu35q5qffzs7zzqwnojk3ireel2jkit2kxgv6bra@yd3gbigdmmdk>
In-Reply-To: <wo5723b7wrmu35q5qffzs7zzqwnojk3ireel2jkit2kxgv6bra@yd3gbigdmmdk>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Nov 2026 13:17:57 +0100
X-Gm-Features: AclHuK-GbM7XVFxqU3dJAQePNml2N4MUSkkmDt3mktzVCdVYt3Td22WOXOu6yXM
Message-ID: <CAHc6FU5HY9x5ntTOz_xk36T0XTzjNc8R4jy2zzpQKo=19HNMog@mail.gmail.com>
Subject: Re: [PATCH 06/13] gfs2: Avoid racy dirtiness check in gfs2_fsync()
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org, 
	Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net, 
	Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>, 
	fuse-devel@lists.linux.dev, linux-block@vger.kernel.org, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iWM5ss0xTQZEmycjIM2zus5RWLyT-R92ZSIWPOcLdII_1795090689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:05=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> On Thu 19-11-26 00:35:42, Andreas Gruenbacher wrote:
> > On Wed, Nov 18, 2026 at 4:00=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> > > Check for I_DIRTY_PAGES state in gfs2_fsync() is racy because
> > > __writeback_single_inode() unconditionally clears the flag and
> > > reinstates it only later based on PAGECACHE_TAG_DIRTY tag. If
> > > gfs2_fsync() unlocked read of i_state hits in between, it will not se=
e
> > > I_DIRTY_PAGES although there may be dirty folios in the mapping. Chec=
k
> > > for PAGECACHE_TAG_DIRTY instead and use inode_is_dirty() helper for
> > > inode metadata dirtiness check.
> > >
> > > Signed-off-by: Jan Kara <jack@suse.cz>
> ...
> > > @@ -760,12 +760,8 @@ static int gfs2_fsync(struct file *file, loff_t =
start, loff_t end,
> > >                         return ret1;
> > >         }
> > >
> > > -       if (!gfs2_is_jdata(ip))
> > > -               sync_state &=3D ~I_DIRTY_PAGES;
> > > -       if (datasync)
> > > -               sync_state &=3D ~I_DIRTY_SYNC;
> > > -
> > > -       if (sync_state) {
> > > +       if (inode_is_dirty(inode, datasync) ||
> > > +           (gfs2_is_jdata(ip) && dirty_data)) {
> >
> > this adds back the I_DIRTY_TIME check explicitly removed in commit:
> >
> > 3aac630b5ce1 ("gfs2: don't worry about I_DIRTY_TIME in gfs2_fsync()")
> >
> > Could you please clarify what's going on?
>
> I wonder how you remember this after five years :). Anyway, the truth is =
I
> forgot fsync path is calling sync_lazytime() as well before calling into
> ->fsync and even if I remembered that, then it would be fragile for the
> helper to rely on that (and there are already users of inode_is_dirty() a=
nd
> inode_or_mapping_dirty() which want it). So to summarize you are correct
> that the added I_DIRTY_TIME check is unnecessary for gfs2_fsync() as it
> should never trigger just for that but it is also harmless and the helper
> is more robust that way.

Alright. Could you please include that in the commit message?

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Thanks,
Andreas

