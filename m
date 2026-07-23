Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E442A162
	for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 10:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802826; cv=none; b=NUMZ8Kl1ZCNKi2NVwG6VUT2Cx6OGcQrAVzXuyfCnqMvTjK2ekj/VaZ2pXfGoNMGppTBK90qHgfDi312OKJsWpHt8E2nt1EEhC1SplrMA6FOrY5RZNSKGvK7k7QdSMBW7M0fwuAQc+mJRNNmKX5jVsqJG8ltoHMZ3TuvJiK7jX6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802826; c=relaxed/simple;
	bh=4yafZFPnyVwBi4okVVI4GeWrVkVxVEVTn1dr+WfM34E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/5SVR/ZOs2+MAC4u7/EKO9I/KyXxO+5+OhtyKoJo2K0aflL6jBG9vKYWz/7MFl7OGPIl8wBFP/mRy783VSwmwdkXtezvtkgc2Hp0LvafR+z0Xcy9QWCyS6tqZVU4dMZIL8qhUI8cmjRLStX9rdMqpM4J1IkzVac4PkR2pd8fbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1n/QbzC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1n/QbzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784802823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4yafZFPnyVwBi4okVVI4GeWrVkVxVEVTn1dr+WfM34E=;
	b=f1n/QbzCJCgrZYtBN/Q5kRlrjLdvKbjvfjQi4C3rVe0ZvAXyzvC17khrZXBfaxCA5F2GJ7
	+D+W8IWkDiCOXYXICzf6v4QeAwdj9wydZxLvbYmhtaZQT/vv7/D8WMrVZEtR8lwSyRd/4N
	+Kji151N8QTCUY5Kupxg6dyYDFRCb9A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-kBbbHt8JM2yjEVwfn1eusg-1; Thu, 23 Jul 2026 06:33:42 -0400
X-MC-Unique: kBbbHt8JM2yjEVwfn1eusg-1
X-Mimecast-MFC-AGG-ID: kBbbHt8JM2yjEVwfn1eusg_1784802821
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-69c2f98aa9fso731488a12.2
        for <fuse-devel@lists.linux.dev>; Thu, 23 Jul 2026 03:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802821; x=1785407621;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WI5zEkKRJ1Ip2LJyTTDzt9st5AsT9mj7pwmV5si8WA=;
        b=n50+XRjiy4lVRTMsiBNdkhpmpKCMsrfFIIi5HbRNBtWUyJklEclECjZmEpcdA8dlU0
         itFQrZL5lf/Yiujk5oR4G6LN2IxAihUMhFmv9FrImY+a4TM6kX3yhazVIh6wUhbtkNwY
         rUZRC2nVlKO+XixBKolYj99JBxA6rGLcWTwnGMK8QrnS5Czajl+lYtTT5W45By3JyRja
         MniRpOT0X9ElLq4mO2EpmYCAyr3HvM6zGEa2N9Q5PSt8OZ+Yfrndjhu2KEiYVaMmAQwo
         E1O+dmpcEq6W3W9SazfGDBXpdm9nuMuEFTbXDrMUDf608A3zhShQw0CNs5oZHKeAXSwZ
         Gjtg==
X-Gm-Message-State: AOJu0Yx1D0JFJDayAZJEicuSXOfoa0yaiYld5Cx1NG+fN9eyy9etUiFs
	sbv6Hv6K3nAzFRclR9d+/PoEFbdTSQSt0dbU14kb8OBZHzmQqgcqk/ci1dIp0qHsjDZ9gnPQEwz
	UpOcUV4ZvgE81v54rzWDMziPaCfxYcz4QjdFcINgFv+RdDksHD0/RZhm2CPIJQzI=
X-Gm-Gg: AR+sD10m/ULHnBwnY7VAJ5JKDkl5dRXSia+W6+JyONtZ513XuIXllAMXiR8wX7PQYIS
	2j3afLwzfibRSz9KM3rgAVzuFobEQyqhsrvkyHLQoE/6XWSOSYyMpCe0+qI02QPB4aSbaBJuE5O
	/CjPqN+zfp12HQBKbaQpS6rV2nqPHxMRWNio4q/FQtsgpTvE+caQdXu3NgoxvAZ0QnGcAkguCN3
	M1+ulOp7K+qvjIoIHXB7n1VT3PVkHy1wNnLm9ICjPedNMO5LQz1SK13Yc2VsG6wgm38eOcRsx5N
	doNXDXph/iIhyxrD0ld/3nqQAHdXUeGUuRo8bYTac3YsmEpbcgeQ6vehPb/6079cFjgXWhU2Rrc
	+Y+OCw/NwUM1KrPqMiE+wH02MgKcagzD3NWUHEuFCihk=
X-Received: by 2002:a05:6402:4391:b0:698:c11b:b180 with SMTP id 4fb4d7f45d1cf-69f6ccd4294mr903532a12.3.1784802821205;
        Thu, 23 Jul 2026 03:33:41 -0700 (PDT)
X-Received: by 2002:a05:6402:4391:b0:698:c11b:b180 with SMTP id 4fb4d7f45d1cf-69f6ccd4294mr903519a12.3.1784802820693;
        Thu, 23 Jul 2026 03:33:40 -0700 (PDT)
Received: from li-88bb8a88-b016-11ec-80f1-6c24081bc674.ibm.com ([2a10:3781:5edd:0:9f93:40c:17a4:1c7c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f345b1a17sm2028009a12.5.2026.07.23.03.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:33:39 -0700 (PDT)
Message-ID: <dac098e12a3a28785e7bebc0597cc8b7f0ab720e.camel@redhat.com>
Subject: Re: [PATCH] fuse: skip destination updates for zero-byte copy
From: Niels de Vos <ndevos@redhat.com>
To: Yichong Chen <chenyichong@uniontech.com>, Miklos Szeredi
 <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 12:33:38 +0200
In-Reply-To: <20260723100743.93881-1-chenyichong@uniontech.com>
References: <20260723100743.93881-1-chenyichong@uniontech.com>
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uf-qjRCo_zojVJ9Gh-UU-xoSMpb6VQAS0MBZ2kEKbwE_1784802821
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-23 at 18:07 +0800, Yichong Chen wrote:
> __fuse_copy_file_range() may receive a successful copy reply with
> zero
> bytes copied.=C2=A0 This can happen even though the VFS only calls the
> file
> operation with a non-zero length, for example if the FUSE daemon
> reaches
> EOF while the kernel has stale source size information.
>=20
> In that case no data was written to the destination.=C2=A0 Do not
> invalidate
> the destination page cache or update the destination timestamps and
> cached
> size state for a zero-byte copy result.
>=20
> Fixes: 88bc7d5097a1 ("fuse: add support for copy_file_range()")
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
> =C2=A0fs/fuse/file.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index ceada75310b8..75eb97b26912 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -3040,6 +3040,10 @@ static ssize_t __fuse_copy_file_range(struct
> file *file_in, loff_t pos_in,
> =C2=A0=09=09err =3D -EIO;
> =C2=A0=09=09goto out;
> =C2=A0=09}
> +=09if (!bytes_copied) {
> +=09=09err =3D 0;
> +=09=09goto out;
> +=09}
> =C2=A0
> =C2=A0=09truncate_inode_pages_range(inode_out->i_mapping,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 ALIGN_DOWN(pos_out, PAGE_SIZE),

Thanks, this looks good to me.

My style preference would be to make it an "else if" because bytes_copied i=
s
used in the if-statement above already too. I don't think it is required to
adjust this, the functioning will remain the same.

Acked-by: Niels de Vos <ndevos@ibm.com>

