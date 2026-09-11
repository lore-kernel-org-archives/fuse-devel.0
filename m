Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472C47CC67
	for <fuse-devel@lists.linux.dev>; Fri, 11 Sep 2026 12:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131421; cv=pass; b=E5JCrL9ovorAzkvWkCSPAR+JJ0+4lVB7NOKPZdd85F//1CSN8Hyhgvx+UUCNbxHmyAtj0BdksavXgJI726z85II0Pg8ydKCLzk0uo9TiU545qPRSTsmAbhQ6tyVtEtWo+QyrSigWOoNgQ0yS8fDyLweZBNWwTN/VF3waErzY9KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131421; c=relaxed/simple;
	bh=FTjPJWgL7azmAVy/OhPs3LK4Og01sRmEWqKMEysRtLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7xIzT+nJyHofKomm5rqTPYVkAHvOeXebQB18I5yIlh2BHmayJAzqEY9HbS1dz1hwL0wkQbMIaR8G4u3TondgbKpg1Id1HXxV8LdEdU/JAD6dQF5E6TSJpPp92e998kFb6hHii0ng0sG9nbjcIk6eNbYl3pA35pz2jyIM2p95f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ+Rsb4A; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ+Rsb4A"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a9983162dcso1224396a12.1
        for <fuse-devel@lists.linux.dev>; Fri, 11 Sep 2026 05:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789131406; cv=none;
        d=google.com; s=arc-20260327;
        b=bVXLfAS5Y4RIiuMcZImLSgWlOZW725oS0SfpYchb4a9KbDbCXhY8fxodsFb45JwLCi
         RnbWK/suOJ1/92U5KP5GWVfM3EPh26wm/93JVM8GPkz7DJjJpm8b7tLFg8YTMUPV4cSZ
         J2Dn3w9OCCwF3fEUYk94b5OQwLa0qbki+sT1xuFB01fEGoZj24X1tXI20dSPG4UfXHEh
         V+DL85/mh8CUYL1J61uKM1ypAwWHL6xC+KuKcwkrZNDRx5uabOXpGj2cqoEKwc/N/qMJ
         kfKP1znqqxh3/4+YLYgSsi4yABV0/S6wM5vuqjFBkr6FJ/ANSD61EOo1wZLzFPWUJpVO
         u2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAN04AozBS+qD8ZJjFEC9wp5PTlWL5yGKkFxUyo/YfU=;
        fh=r271R5s2pg7afxFnByDETpieHben1dr47Mxd2Vt/JG8=;
        b=Rsb6LuTHDCC3SkD4MM2EkzvjugDTYJpqTwVcN/47qJkstnYN1oRYYz3MgjRV5Eb3vX
         sZQd63y7jJfnPtcWd65BnRorP0r+Hi51nbQ+yaxvVSh3KU+oGA/5r9XYj/BgrIpl4dnk
         yUxAtuxEl8NMK4s3AGlapXiDKBb8S6OCR9sBb6HUNV4/hmU0EFhDOjYozqn5hthfMyvV
         q43rvL82RiJHJLEeAfk8OuQyfe6coL9qrPSmvfcrtKEsCLZD91wOJbPXJzwaAMQ9DPKk
         kChHZLVjXafO3QE1qZ8J6JYQL2RtyKSozdY5mJBNNEadzQjxmf2BeUQIkWVF2Jt5RNi7
         9chQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789131406; x=1789736206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAN04AozBS+qD8ZJjFEC9wp5PTlWL5yGKkFxUyo/YfU=;
        b=UQ+Rsb4AwunOw2S7smcQX+nVnk43pffNqQxBec986odb5DYJWaGcfFDkC4si1lmdrx
         OeIltJY4zO29YcCOiGKiFlMcJ0nbSqQQ7wBT7Y7mVwvPm4VGjhpV9fUCWfIOWOzrI1kj
         h46jF3o+9LC7IMwh5Ps6eCOoZUQO6m62aQvm1hnf+ZYCuAeuCRyOChkgXCB+275OzpCb
         o8Bp9/N3Cq1NA+7tSdNqh9ASC+UqhQJgGPzJWpWxyVlKADBdNqop8tKcj0kU5J4uQnl5
         hkzfcihVn1e+XWg3uxuaTfqISMxxAnY2CQaqdFqq531VxqzN0XKN8wyN4hIJx+vbNL+G
         fX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131406; x=1789736206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAN04AozBS+qD8ZJjFEC9wp5PTlWL5yGKkFxUyo/YfU=;
        b=mD+BGssI5gI2dBJPjDoPJyeH+CVUyzkPX0wXppXfKT4tUjzpByjZD0xtd773Y4OVbg
         dmPKzWfzIHfEnJYgRDnsSqcm4rWTC3tjsrMv0u1xYlHZfrmiaJ4ffOxoQvmEvJs2/2hG
         smiQhP02ni1lJ4O9uRHNU20bFvypeb/EnYZTIRsqC6H8mxDt4Z/9i7R1/jxsG3POBewI
         9Em1B1Hzbks2h/1+rCsnSYrK+JKSOXvm3Kcg9MPvx/39m/toqw7Dgv2OOMzxyNOAcZjw
         azw/F+rsWLEIs2cQ9CEcwHllyX0Z0z+7y1SM4POknbp5omUjVIqh9mUjl1c5qbJ02aV6
         bwzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOlaiaa/ayJJTyoCKmpK7TgDqNVUC1bBZEXGzkZDe8NF2Zho1IkCehBjw1TFORgYLYU7IpJJeSZItl@lists.linux.dev
X-Gm-Message-State: AFuF++nMfs4odD6eI41bDRgqJ8D0R+S2vYun+vGLgrPiKnUoufcTmV4x
	mxIrDeooE5cO0lRwBxQ2OTEIbQ/a3Zryj08zLwBxrbsTlsfGTD7rc81vWmz3XjhYp3gLn8jswLU
	Vj+KzqCTlp2R6xUdAM2Vy6Btnn/0GsSQNOfkKHTE=
X-Gm-Gg: AYBFou2r62f/X5+bygxqhZGYqf/Ec4nUFHbY5oo4SXv+VBOMeXloONw6C3f9vieJOvF
	cZBMweqcvgVd+NnVd/dmG9PGS5xgk65ESJpaI6YGM4XDVqvqrAAXOyfGGhGkjADXHL8eHYebeAB
	DuciljRbu9SCYxGkiwfhJa7ENcxkTl79SjBwhoG6N+TiheqreZ5AKavCSsJLMqmxdL/MjREH8ht
	xLxfN9WOBU8BHs6WRhVpww2VOzh1KDsBzkNSfUV8UvxVRTMTwdgwKMgAhLsFwcx7Unxr2emlQqM
	mlvRiQdekMNqvf/8iLJYBiZGZ1gwqMsWWlYQo9sTC8ohxaeOOalhCBwdSQ==
X-Received: by 2002:a17:906:6a28:b0:c29:5a76:72be with SMTP id
 a640c23a62f3a-c29667452e0mr193985066b.24.1789131405334; Fri, 11 Sep 2026
 05:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-1-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 11 Sep 2026 14:56:34 +0200
X-Gm-Features: AcwNN1VmpaVZZkPEwLu7gA0px9cF_wj46GJyQgXpsE6qhM5m6PYwOOCkk6vrVRM
Message-ID: <CAOQ4uxhbbfn7pnq3YNMKpYDAjyZXdZcJoBpnkzjJwOdeDw9jow@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] fuse: extend passthrough to inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:51=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> This series extends fuse passthrough to support inode operations (getattr=
 +
> setattr) and directory readdir.
>
> The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse inod=
e
> only when a passthrough file is open. This series introduces
> FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode number
> mapping, which allows attaching a backing file for the lifetime of the fu=
se
> inode.
>

Hi Joanne!

I wanted to see how we can unblock this patch set
(did someone say conference driver development?)

The main contention point for me on v2 was the fuse_entry2_out API.
And the suggestion to do a composite LOOKUP+STATX defers this patch
set to the unknown future of fusex.

My favorite solution to a problem is to avert it.

The question is how to include the backing_id with lookup/readdirplus
reply. The answer is that there is no need to include it.

I have already discussed with Miklos changing the UAPI to
widen the backing_id to 64bit and to let the server choose the id [1].

Considering the fact that FUSE_PASSTHROUGH_INO literally means
one-to-one inode number mapping, it seems a bit idiotic that the backing
id (should it be widened to 64bit) be anything other than nodeid.

The new 64bit UAPI is something like:

 struct fuse_backing_map_v1 {
        int32_t         fd;
        uint32_t        flags;
        uint64_t        padding;
 };

 #define FUSE_BACKING_FLAG_INO_ATTACH

 struct fuse_backing_map {
        int32_t         fd;
        uint32_t        flags;
        uint64_t        nodeid;
        uint64_t        ops_mask;
 };

 #define FUSE_DEV_IOC_BACKING_OPEN      _IOW(FUSE_DEV_IOC_MAGIC, 1, \
                                             struct fuse_backing_map_v1)
 #define FUSE_DEV_IOC_BACKING_CLOSE     _IOW(FUSE_DEV_IOC_MAGIC, 2, uint32_=
t)
 #define FUSE_DEV_IOC_BACKING_ADD         _IOW(FUSE_DEV_IOC_MAGIC, 3, \
                                             struct fuse_backing_map)
 #define FUSE_DEV_IOC_BACKING_DEL         _IOW(FUSE_DEV_IOC_MAGIC, 4, uint6=
4_t)

---

- Server calls BACKING_ADD before open or before lookup
- fuse_backing is stored in backing_map hash table instead of idr
- With flag FUSE_BACKING_FLAG_INO_ATTACH:
-- If fuse_inode of same the nodeid exists, fuse_inode_backing is attached
-- On instantiate of new fure inode, if fuse_backing exists with this nodei=
d,
   it is auto attached the the fuse inode
-- This attachment lives until inode is evicted (same as in this patch set)
-- requires FUSE_PASSTHROUGH_INO
- Without flag FUSE_BACKING_FLAG_INO_ATTACH, backing is attached
  to inode on open as today and detached on last close
- The server attached backing survives inode evict and it is up to the serv=
er
  to do BACKING_DEL on forget if it wants to
- BACKING_DEL only removed from the backing_file hash table -
  it does not detach fuse_backing from the inode (as today)
- BACKING_ADD to already mapped backing or already attached inode fails

FUSE_OPEN reply does not need to include an explicit backing_id.
It's enough to set FOPEN_PASSTHROUGH because the backing file
is already attached to the inode.

Similarly FUSE_LOOKUP and readdirplus do not need to change at all -
server just does ioctl BACKING_ADD before the reply.

For backward compat, FUSE_PASSTHROUGH can use the old
BACKING_OPEN/CLOSE with a naive 32bit id allocator.

[1] https://lore.kernel.org/fuse-devel/CAJfpegve9GMTRwvoA5y7AzUSD4e_EDJFzsq=
hCVN8xQ+RjQ=3D+Sw@mail.gmail.com/

What do you think of this plan?

If you are on board, do you want to take the lead or shall I try to allocat=
e
the time for it?

Thanks,
Amir.
