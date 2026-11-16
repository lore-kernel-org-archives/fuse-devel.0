Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830457;
	b=WESdFybMWqr/gJ+iA/bJ0hLOHyEegHpN3unGS5JQqxyuJpKteU2hJBFmE8tZl5kSstve
	 3ATt1jzHvhi1OToIYELYrJ6VnI2ToSQS6fVTMb19pQax2ln1chyI4hlOf76rIyOxWk5LA
	 QqXTNVPBNvsgIwz0xMfASOJ598NuNebWwsW+L9iQ1h23cQtMF8s/hg23qpNa/V8KlxWMy
	 9jPnxh5lzbf6ij/riNnRDozTHFu0CFLkt5W24r2Giing3zx3gS96r6NULvPSJXua/gniI
	 amgobZ4E70taHmDx5aiOYZF0sYsMBj+yBuDTfDHg92Ak4IviJ9dpR2lsCdkUWNCmt5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
	b=Dnh6vmkeTTK1wdtyMXJ/Kh9Nlki9/gmR181xJmNbDdfPzSHO+QsAnvn2e+/LN+PSd68B
	 UrVp7ATVEYcMckyQMpLqAiZqelDqD7HymEcb5uc/yfLJ1GnS8HcIsu1SDnBme2voEuLd2
	 Bd2CVBH5z4T9ETY1SXZMMe84q/CaMRvO+dHKGfamQjdHWTfH78f+CQjwe6irbFgZLwTAJ
	 Z5TAtuQr0T6BrPXNNP6AKug2BRtlQhNeLGBOoK/cM7x/RCvhJ0tqfwkP/QhWBI9CFo6QU
	 MXnHj5g7C4WF8WCeUsPKmQCddw/6ixOEs2ZNnB9K/2wAP3qTOy48vDswdYeYXKbSAUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CVWVNvSq;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A0606A334
	for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B0A0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CVWVNvSq
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49d70f45b22so1149901f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 16 Nov 2026 04:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794830455; x=1795435255; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=CVWVNvSqZ4Kvef9qLV13IEC3wrRDMTDLd1UcYfVh3RelG4sKSQwdvnpgNda+b8r1CS
         eli/q4umBwmNIrBBRVOSKSN6xcvy4LUaUh2LOGQRiQ7hXSigawtn6iNVRbkygI3zV7Pv
         uTHA5OlJFK1RtoFT38tnvJ1gsUTqMy9BWqCDcZ9fxYE+WfSCGmwpZfpwnx/yMaEQvdU3
         VV2CJd+AJFB+qDkTKJIJpCE77NldlBXcjqe0PbecLfz/BOm3ZNYcchBSAs6OoGUXDJwB
         gNyEKrURC7L1yFfUoGyPkyybCL/CsRYBWTncrou+S+70FvW8ktjvogRu5VIIzmhynoEF
         EdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830455; x=1795435255;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=iQx65Na7bML98acpkYsOA1gbBCS/saBedAm79BIyf1KRN7H5TYpe5zBCEV9bL2gQJ+
         ijJsTrQe96uFAUAS16PmWgw0i6PE2LIRX6xffusnWIhUtJMdgEDDYH7GoTcqAnO+xjkn
         xJR/a1pou1vd8o2hFOEW/Zztfe228ZTLOJzgvMpeGZ/czKCaXV6PElR/i7wbDPyK2Aoa
         b0HsJYB3m7dS8HmxarIjKkSITMitK5BezeTVe2erXr+XjPSaNzkfCxNoqZPX5BL536Hu
         2CQZOQWg/y61GShmj0q+nML5HCf5M7QN5C9nZX1hHWWpKtEdsOWVsEMBPVq1b/jXxBsz
         GerQ==
X-Forwarded-Encrypted: i=1; AL+hErGEp/5ecoeIxvcmplmscdRwj8biLhVu5RpXPoNWrxWXZoLT9e/eLDyg0Pe+oFafk5O2C340lObtVU4H@lists.linux.dev
X-Gm-Message-State: APuU4Z/1tj3JFbWmk01vetYVHQFEvhskomJ0heDa+Dfz/a3WwdHJ4be3
	fYpPzD89PSVj5Ua/6mzZIpcDviBhZhyRC+tCar0fSedbksrXVjuZ6U6SZRiJuirlXqVGS6Q4NLs
	6zGFZ50VR3AwLdtVY4w==
X-Received: from wrso13.prod.google.com ([2002:a5d:474d:0:b0:493:3d97:6e88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr16698595f8f.12.1794830455230;
 Mon, 16 Nov 2026 04:00:55 -0800 (PST)
Date: Mon, 16 Nov 2026 12:00:53 +0000
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116120053.371591-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 12:04:45PM +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
