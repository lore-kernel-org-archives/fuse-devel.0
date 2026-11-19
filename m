Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047921;
	b=xSqlNYJhrO66b2Q7YANTEwvwUZrFFeUYdYk4WgTDZNYf4QvEAcZ9Ffd00VImyXInY5pB
	 tNf1rUnf4YlGoMP4xsX/+9HnhgZKS+vscN3CVvagUf3fuqQzfkhkDHwfkwZbjkTD65FPf
	 1Q1+kro6XTr+jAL3sBgkvGFV4BX92QLnVyciRzcgtwq4xLg8l923hvosgf6Tokh/wQjnW
	 0BKQ+yTEJWdxIXQI1aJKEBWGG4j/+f8ur3j05mLmxHeTDt8jxtev0S9zacLxEemslBjBj
	 KCesfBsk4cemV731ItSVq7rt6Wa4cphiFeEk/1MEpatKTPGFtmUJQhaC54ci4cRlbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047921;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=M4+iI66pVBP+4vibL3T75xrw5k3lOfdLMjtLDFVvV8g=;
	b=IvYEYg1B0DgljH1egeVC8N0NS/Wu69UeN3Sq1r7Lq13Iy9rylhX9vnSouxlrdoZ1gTkQ
	 aDgsqS2tZCC15E4V+NVUpJGDCMyqygjyHaDspCRfjYFDZx0vAKKq41BhEFCKTNWEk+K2y
	 QDGKmDCPpGUaFCgQLJoqc50GA2kpTCDj6gHxGycNO+fKDkKYQ4M1CYU0dtpCiv0JIcfBa
	 eQpNoopjLk4srjDoVfzvQn1H5Y/XgNS+qZcsiFrfKwIZ6bX9YUi0qC9nx5K4g8b9ro227
	 ZS13VCwfiZDXWP3AIDn8K7smJoi58kfJiY7vsB9Co9D7zTu25O4/xXe8DdpJeJyhQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=figiuMqN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B2160A2604
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 00:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B2160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=figiuMqN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795047919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4+iI66pVBP+4vibL3T75xrw5k3lOfdLMjtLDFVvV8g=;
	b=figiuMqNPSbJSC+rppKYW73jTrxg0F5RFlFTF8isncIxQMPE1WxN7Bn1FHZTvLkpofJq4d
	7m420J1xkEdKbn3Rcx5/MaC0RJqvUstWY08DU3pgmjHol80seQFiw6J/Lwkk9/s2t1SRbD
	9rIFexGnSFloom9KDpPKlHqDR/WtULw=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-obvcjyVhOL-7VxZIa0n2aQ-1; Wed, 18 Nov 2026 19:25:18 -0500
X-MC-Unique: obvcjyVhOL-7VxZIa0n2aQ-1
X-Mimecast-MFC-AGG-ID: obvcjyVhOL-7VxZIa0n2aQ_1795047917
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67dcb5f084cso2839448d50.1
        for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 16:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047917; x=1795652717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4+iI66pVBP+4vibL3T75xrw5k3lOfdLMjtLDFVvV8g=;
        b=crzXUPzD36aXwj1cTUK5Q1kTgtqVOfRqfsayXkOgKQEQFZuflJHA+wv6oOp12jmJC2
         AdNzltmYUoJiESsbDBhHwG6PV2eVYQwu9KbVf1N71qvRRAS4AHLrnf5IugqZZbxou9MA
         mvhDWlV46wNnZ6rESjbqw1dvJLXJWvx69/6prRaJbW+eRIcDxXBS80gjOhH2mRa8ptra
         NdtXcMMn5Lo2WFZORp9qIIZyKVT3ewk3LwOAZaxXqZEQ1XIYd8S5EVv++1ZCQzHQX0gA
         d2LnU/bhfxwMVlBKZV7DcGCTK2G+iAbxWbzZQEtxLzq4fhhj0Pef/yFVDc8yDsOoi7H+
         UtSg==
X-Forwarded-Encrypted: i=1; AL+hErFNqYkE947cbYN+dvwCIqgnpJp+EHp1jaCmwTvJ55lxySMKwyCqRBR7SCyZiRLV1agyaLJUxQEMgzeh@lists.linux.dev
X-Gm-Message-State: APuU4Z/diHsfqmWO02Pp0F2IRGgQYC6ocIB11HvW+2cD8rh2nJkDqW21
	iSkAg9TfUpcbeKhjEnL/ocXjKWMkYR/C+DzGadqdJdL/Npb5EUEHm4d2h0xR2goma5/4r0X4bVJ
	/EFuNXei8aTde/rm8mPGDo6XCV9A8+uE7oqjBZiebt5nZOXwKL0tq7yHcvxOfe/pN5nJz1vVTLa
	QiPfOFVd8bFp8Yc6+TqPPumKAB0oHBE+m29pDWYg==
X-Gm-Gg: AZFdTZcWwg/AtGEHVCI5T16t1OOYoQVvsp+Lxiz20ZteJuI2MFgJXcDk6/FSZaa1g4O
	5j5zh/mZ3Ml1Sr8j1zygwkbPtRIQobqq4sqNSgXku3NcqZnxZAZI7RPVvoWWCYj0E4dkkhL6dFh
	CTS3jqzYbTsnELxG7YAZ7OULthcDJwAYVf7s8A+ABDaihnytf8zYlCO/A8zzZxuU5SLFMaTmBbV
	cg6eaPfCKaRLPSMbUhXcXvh3A20cAl4ORcUv8RuG3kJlg==
X-Received: by 2002:a05:690e:1553:20b0:67d:b309:a247 with SMTP id 956f58d0204a3-67dd3f89d1amr1300395d50.81.1795047917451;
        Wed, 18 Nov 2026 16:25:17 -0800 (PST)
X-Received: by 2002:a05:690e:1553:20b0:67d:b309:a247 with SMTP id
 956f58d0204a3-67dd3f89d1amr1300383d50.81.1795047916923; Wed, 18 Nov 2026
 16:25:16 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116171044.6938-1-jack@suse.cz> <20261118145941.1063127-21-jack@suse.cz>
In-Reply-To: <20261118145941.1063127-21-jack@suse.cz>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Nov 2026 01:25:06 +0100
X-Gm-Features: AclHuK8SUbQZgISlLcenRaPXTNhazVJfuhMt4GCT6fjiABD73HgWRuB83sKw5Dc
Message-ID: <CAHc6FU7qgJ1R-bz2icUyQTQFs7_mKt=tat-ut66K-cgn-uet3Q@mail.gmail.com>
Subject: Re: [PATCH 08/13] fs: Provide inode_or_folios_dirty() helper
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
X-Mimecast-MFC-PROC-ID: ZFDNRelp4Vc_u52i84Ys8ClRMU2h-Dh7UjEBXny4rUo_1795047917
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 4:00=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> Provide a helper function checking whether inode itself or some of its
> folios are dirty. We'll use it in filesystems instead of direct i_state
> checks. Note that this check returns true also if only timestamps are
> dirty when lazytime is enabled.

This is confusing. Can we just say this here?

"Also returns true when only the timestamps are dirty."

> This is what users really want.
>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  include/linux/fs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 025f5d890689..f602deacf953 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2228,6 +2228,13 @@ static inline bool inode_is_dirty(struct inode *in=
ode, bool datasync)
>         return inode_state_read_once(inode) & mask;
>  }
>
> +/* Check whether anything in the inode itself or its folios need writing=
 */
> +static inline bool inode_or_folios_dirty(struct inode *inode)
> +{
> +       return inode_state_read_once(inode) & I_DIRTY_ALL ||
> +               mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY);
> +}
> +
>  static inline void set_inode_metadata_writeback(struct inode *inode)
>  {
>         spin_lock(&inode->i_lock);
> --
> 2.53.0
>

Thanks,
Andreas

