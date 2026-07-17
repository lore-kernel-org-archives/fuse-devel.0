Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53A34EF0D
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 03:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257421; cv=none; b=TcZaeSp9rb6oeU2VPwVLP74RaoVr8tJlx8f2DbV4rHe4NfItfyp6mXEJ6Fsc1NKjq5dNIOSSkaozB/IdlnaQrrWJxX5t4aO2ZasMt9Ao7q0W+F6KCxkyR9h4kL3ifzYUH/PcAGU3gy/8yUZKftqaVqyoSCRtv2OrKG1xgmpkX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257421; c=relaxed/simple;
	bh=QBTkGzDpepugLp6lobBaZUvB870pBpPapiEaGcJzFbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OU/oRUgvf3/wJA3yJPYW4sjiJB0TKOOb540vIskhbGyrjTfi/b1U+8TU4HPSo26qjKQUhC4ZwhLz57L8MavaQ+35GOatVZPjWfVH3natQ+hrKhl8oHFshvanbJcw8xFcx06DYRptKiNdK+5MmZOkH+30wQI7Y+WG+a3gsRgvsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 18e5ab46818c11f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:87d4d4a4-6efd-4cb2-8162-2d91bc32f389,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:4bf8533f5b04b8647e1d374ef5bfc9f6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|850|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 18e5ab46818c11f1aa26b74ffac11d73-20260717
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 532825471; Fri, 17 Jul 2026 11:03:33 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: joannelkoong@gmail.com
Cc: miklos@szeredi.hu,
	fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	djwong@kernel.org,
	brauner@kernel.org,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: Re: [PATCH] fuse: honor desc offset in readahead reads
Date: Fri, 17 Jul 2026 11:03:29 +0800
Message-Id: <20260717030329.910813-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAJnrk1ZDc=f1XvRU6j6WsqiSAy75wd1-X2fNRhcK3j-OGDkqcw@mail.gmail.com>
References: <CAJnrk1ZDc=f1XvRU6j6WsqiSAy75wd1-X2fNRhcK3j-OGDkqcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 16 Jul 2026 11:11:10 -0700, Joanne Koong wrote:
> nit: is this newline needed?
>
> LGTM. Thanks for catching this.
>
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Thanks for the review. I'll remove the newline in v2 and keep your Reviewed-by tag, as the logic stays the same.
