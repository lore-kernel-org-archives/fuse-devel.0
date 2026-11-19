Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047181;
	b=wPTQyP8tSLHb81rqn4jA5nj8OG0RlNvnpcTt8DPm+QiUBrFwMYJ+nK6+7a+J9Qis/TRa
	 8xTUDl3IpnttQ9GoVm0QbqaSK0USA4SneWBeW8ialoIff//GmtFSx/4ybHBQ8rYFz4rE8
	 MycaNpD6aujDBhYmah58FgzgKE45XaMeF3I0c44FAHQzfkzBzhU4tYqV+X5SSMS3iAqsT
	 DTw68OyVemCrlAYqw0pR2XvbXsN2sU2KKsqHljpoR2pQDIjHF+MwzcHvb5NT9LD85y6Mn
	 Dcy1mUwfwCSCl60kAju/SnhD/lTC+5i1hFomsitro23w9xf/bQX+DcEF8lxadRiRd3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047181;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=077/TizvhH3iQcetqO0vvepvTnfIkqb5hqSDa7XFIt8=;
	b=mMII14Gaj3Hl49T+ohx601OKoyJvUoJstr2a19Hx4V1q7mqk1oRKMbXG88ENF3w/hS+m
	 cbIJVcpp2E1X/Gp7KO4UY2bn/Rm/RC0P0Vdzn1997gYfGLRBPvTOHoLTMwyFTb/tprj8j
	 4UN+XEIcsKiUGuqazZLFjlGyUB5wPH1sQzvUqIk5lYXMU1WOJCxzjx3FjSek03WT+mjm7
	 7w482mJbZlD1IO9SWTFBGe3Cc90u0Y/sgcuAvsTwt9dGfUOLe0a/9gubp2yQ8uGHoK5AY
	 YyZwTqJUNTHI7hPyQ/9w6msrNKOGnMgrwNmdKvKoDk4L8VT/B51TiTrbCwp41MFFUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EjHXD+uH;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F8606A325
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 00:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C64F8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EjHXD+uH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795047179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=077/TizvhH3iQcetqO0vvepvTnfIkqb5hqSDa7XFIt8=;
	b=EjHXD+uHIPilX0rB0j3Mlz2PJl5Wi/+DfCXmEOtxmu6urupg9yBolQ8etjCxA4Lu+f1RJA
	UnPoNl/XtRiUArG2jVcKflDK+1Z5hzEF1Pduh5IDJ0BymRJwdm4ZSe2v12QFbs5YyQUVYg
	glzbZU2VWYP3jIPfmZOsVF1LyqqNm7E=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-3butAa4MM36wQ2K4FUnvFQ-1; Thu, 19 Nov 2026 00:12:58 +0000
X-MC-Unique: 3butAa4MM36wQ2K4FUnvFQ-1
X-Mimecast-MFC-AGG-ID: 3butAa4MM36wQ2K4FUnvFQ_1795047178
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67be4f2f42eso2524926d50.0
        for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 16:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047178; x=1795651978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=077/TizvhH3iQcetqO0vvepvTnfIkqb5hqSDa7XFIt8=;
        b=fBefjjT1kgo/wp2vmT3aughshQfvoqz/m1HokCAJXj9UrsEKJ56WkWG+lOw9pHpMpH
         QPT3jjwMybOMT724x/pQRsBkrJfEvfZJjMGF9Fo4T56ZKaIW4hBHca4sk88b1PnGE2EP
         AuYvlk7tYAjdP+umj5zbz48J9ZK5tk0g7k5llMw4gIXRLRTEP/IuxXg34Znd6MVJ9b7G
         Z6i0cOcT8p7h3bQypsITWiT0CbiGch/o2kM9G3769vav0lNFclrb7nC9O+o5fbnlm9tZ
         zjGq/oisx6s1ggyeX7WNrfJCJrA1fuzRtisC0GXK9y+qijc/u4rvJKvkzMsiJSTMO3uj
         7doQ==
X-Forwarded-Encrypted: i=1; AL+hErEkRpaHpndAT1SUnmzLxC+a9ukaiNnDu0UdLMY2SiYyVRN+xHQmxjABz+VuANrcTwgCsoLPSFS1vWIH@lists.linux.dev
X-Gm-Message-State: APuU4Z8f76xUB0IaAFvdn5kANTLxE5NMHTAAkNdRG1o+vjnQINksfQQK
	uIcl1cMiXeKY8OV3Pl/zBNy5FOZCVGhsT46gUB8Gwb5AdJEsw95F5uUZAMt+rrWtkwxvW5KyW4h
	IlZznFDMgCrodmaygKVWBrIlzJIpLxot5MXmfaFH5DYIOpoG5yi8MPQsc0xgdshXumlILR/wlWa
	WHqtoQZ/rdgTax+/2I3ywSkSg97fcM4s37Zagpkw==
X-Gm-Gg: AZFdTZcuOhiqi+nbmSO4vJxina2yPaRUUyKr80Gnlh2Pm7tG9dJatMJ9wy3IXHmbk29
	M33G0TDqzWq+zXeNsifrdp0aj9bFHK16mY0p0m/E33uh3V8YkGWAuUkU9lBJ631XmPwhm4S0SzJ
	soksz20aZ4jKZiQ5dDqVPqMvPw/helndWVodfMAF60Sw52iKYOZAdX/HXA7ccrg2iQCR9XuPIzO
	6bjKfyRMgL5yhZeE4BAo70B9prqkhzPak5Sl2iSpxDOhg==
X-Received: by 2002:a05:690e:1907:b0:67d:b34c:9f19 with SMTP id 956f58d0204a3-67dd3fdcc80mr1565908d50.106.1795047177759;
        Wed, 18 Nov 2026 16:12:57 -0800 (PST)
X-Received: by 2002:a05:690e:1907:b0:67d:b34c:9f19 with SMTP id
 956f58d0204a3-67dd3fdcc80mr1565894d50.106.1795047177150; Wed, 18 Nov 2026
 16:12:57 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116171044.6938-1-jack@suse.cz> <20261118145941.1063127-22-jack@suse.cz>
In-Reply-To: <20261118145941.1063127-22-jack@suse.cz>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Nov 2026 01:12:45 +0100
X-Gm-Features: AclHuK8R-2iEv0c9btS3snfH7Yzq75Yl9vf1mN1FPuSVCWTRM2Ut7aYcwFy-L9Y
Message-ID: <CAHc6FU4+FV=A2UK1oPejHSt5XQ2Ox+CyvZfT4Q17YaceJ+NJ1w@mail.gmail.com>
Subject: Re: [PATCH 09/13] gfs2: Fix dirtiness checks in gfs2_write_inode()
 and evict_linked_inode()
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
X-Mimecast-MFC-PROC-ID: nUKc1far2ssuSwsHCZMM0RtLmUg-unnaSTGffJhLfKM_1795047178
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ja,


thanks for catching this.

On Wed, Nov 18, 2026 at 4:00=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> The checks are bogus because they check against inode->i_flags instead
> of inode->i_state. Use the inode_or_folios_dirty() helper which actually
> checks what was intended.
>
> Fixes: 957a7acd46e6 ("gfs2: Remove inode from ordered write list in gfs2_=
write_inode()")
> Fixes: bd67f17718cc ("gfs2: Fix data loss during inode evict")
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/gfs2/super.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 04bb4cf787d4..9b723dd591a5 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -460,7 +460,7 @@ static int gfs2_write_inode(struct inode *inode, stru=
ct writeback_control *wbc)
>                 mark_inode_dirty_sync(inode);
>         else {
>                 spin_lock(&inode->i_lock);
> -               if (!(inode->i_flags & I_DIRTY))
> +               if (!inode_or_folios_dirty(inode))
>                         gfs2_ordered_del_inode(ip);
>                 spin_unlock(&inode->i_lock);
>         }
> @@ -1418,7 +1418,8 @@ static int evict_linked_inode(struct inode *inode, =
struct gfs2_holder *gh)
>         struct address_space *metamapping =3D gfs2_glock2aspace(gl);
>         int ret;
>
> -       if (!(test_bit(GLF_DIRTY, &gl->gl_flags) || inode->i_flags & I_DI=
RTY))
> +       if (!(test_bit(GLF_DIRTY, &gl->gl_flags) ||
> +             inode_or_folios_dirty(inode)))
>                 goto clean;
>
>         /* The inode glock must be held exclusively and be instantiated. =
*/
> --
> 2.53.0
>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Andreas

